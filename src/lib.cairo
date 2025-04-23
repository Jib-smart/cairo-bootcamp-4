use starknet::ContractAddress;
pub mod events;
pub mod interface;

#[derive(Clone, Debug, Drop, PartialEq, Serde, starknet::Store)]
pub struct BankAccount {
    pub name: felt252,
    pub address: ContractAddress,
    pub balance: u64,
    pub opened: bool,
}

#[starknet::contract]
pub mod SimpleBank {
    use core::num::traits::{OverflowingAdd, OverflowingSub};
    use starknet::event::EventEmitter;
    use starknet::get_caller_address;
    use starknet::storage::{Map, StorageMapReadAccess, StorageMapWriteAccess};
    use crate::events::*;
    use crate::interface::ISimpleBank;
    use super::*;

    #[storage]
    struct Storage {
        bank_accounts: Map<ContractAddress, BankAccount>,
    }

    #[event]
    #[derive(Debug, Clone, Drop, starknet::Event)]
    pub enum Event {
        AccountCreated: AccountCreated,
        DepositMade: DepositMade,
        WithdrawalMade: WithdrawalMade,
        TransferMade: TransferMade,
        AccountClosed: AccountClosed,
    }


    #[abi(embed_v0)]
    impl ISimpleBankImpl of ISimpleBank<ContractState> {
        fn open_account(ref self: ContractState, name: felt252) {
            let address = get_caller_address();
            let bank_account: BankAccount = BankAccount {
                address, name: name.clone(), balance: 0, opened: true,
            };
            self.bank_accounts.write(address, bank_account);
            self.emit(Event::AccountCreated(AccountCreated { name, address, balance: 0 }));
        }

        fn deposit(ref self: ContractState, amount: u64) {
            let address = get_caller_address();

            let mut bank_account: BankAccount = self.bank_accounts.read(address);
            assert(bank_account.opened, 'Nonexistent Account');

            let balance: u64 = bank_account.balance;

            let (new_balance, is_overflow) = balance.overflowing_add(amount);
            assert(!is_overflow, 'Balance Overflow');

            bank_account.balance = new_balance;
            self.bank_accounts.write(address, bank_account);
            self.emit(Event::DepositMade(DepositMade { amount, address }))
        }

        fn withdraw(ref self: ContractState, amount: u64) {
            let address = get_caller_address();

            let mut bank_account: BankAccount = self.bank_accounts.read(address);
            assert(bank_account.opened, 'Nonexistent Account');

            let balance: u64 = bank_account.balance;

            let (new_balance, is_underflow) = balance.overflowing_sub(amount);
            assert(!is_underflow, 'Balance Underflow');

            bank_account.balance = new_balance;
            self.bank_accounts.write(address, bank_account);

            self.emit(Event::WithdrawalMade(WithdrawalMade { amount, address }))
        }

        fn transfer(ref self: ContractState, amount: u64, recipient: ContractAddress) {
            let from = get_caller_address();

            let mut bank_account_from: BankAccount = self.bank_accounts.read(from);
            let mut bank_account_to: BankAccount = self.bank_accounts.read(recipient);

            assert(bank_account_from.opened, 'Nonexistent Account');
            assert(bank_account_to.opened, 'Nonexistent Account');

            let balance_from: u64 = bank_account_from.balance;
            let balance_to: u64 = bank_account_to.balance;

            let (balance_from_new_amount, is_underflow) = balance_from.overflowing_sub(amount);
            assert(!is_underflow, 'Insufficient Funds');
            let (balance_to_new_amount, is_overflow) = balance_to.overflowing_add(amount);
            assert(!is_overflow, 'Balance Overflow');

            bank_account_from.balance = balance_from_new_amount;
            bank_account_to.balance = balance_to_new_amount;

            self.bank_accounts.write(from, bank_account_from);
            self.bank_accounts.write(recipient, bank_account_to);

            self.emit(Event::TransferMade(TransferMade { amount, from, to: recipient }))
        }

        fn close_account(ref self: ContractState, beneficiary: ContractAddress) {
            let address = get_caller_address();

            let bank_account: BankAccount = self.bank_accounts.read(address);
            assert(bank_account.opened, 'Nonexistent Account');

            if self.bank_accounts.read(address).balance > 0 {
                self.transfer(self.bank_accounts.read(address).balance, beneficiary);
            }

            let address_zero: ContractAddress = '0'.try_into().unwrap();
            let closed_account: BankAccount = BankAccount {
                address: address_zero, name: '', balance: 0, opened: false,
            };

            self.bank_accounts.write(address, closed_account);
            self
                .emit(
                    Event::AccountClosed(
                        AccountClosed {
                            closed: address, beneficiary, amount: bank_account.balance,
                        },
                    ),
                )
        }

        fn get_balance(self: @ContractState) -> u64 {
            self.get_account_details().balance
        }

        fn get_account_details(self: @ContractState) -> BankAccount {
            self.bank_accounts.read(get_caller_address())
        }
    }
}
