use crate::BankAccount;
use starknet::ContractAddress;

#[starknet::interface]
pub trait ISimpleBank<TContractState> {
    fn open_account(ref self: TContractState, name: ByteArray);
    fn deposit(ref self: TContractState, amount: u128);
    fn withdraw(ref self: TContractState, amount: u128);
    fn transfer(ref self: TContractState, amount: u128, recipient: ContractAddress);
    fn close_account(ref self: TContractState, beneficiary: ContractAddress);
    fn get_balance(self: @TContractState) -> u128;
    fn get_account_details(self: @TContractState) -> BankAccount;
}
