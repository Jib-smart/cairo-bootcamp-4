use crate::{EventSpyAssertionsTrait, ISimpleBankDispatcherTrait};
use super::*;

const U128_MAX: u128 = Bounded::<u128>::MAX;

#[test]
fn test_deposit() {
    let contract_address = setup();
    let contract_dispatcher = ISimpleBankDispatcher { contract_address };

    let name: ByteArray = "Olowo";
    let address: ContractAddress = 'Olowo'.try_into().unwrap();

    start_cheat_caller_address(contract_address, address);

    contract_dispatcher.open_account(name);
    contract_dispatcher.deposit(U128_MAX);

    assert(contract_dispatcher.get_balance() == U128_MAX, 'Balance Mismatch');

    stop_cheat_caller_address(contract_address);
}

#[test]
fn test_deposit_should_emit() {
    let contract_address = setup();
    let contract_dispatcher = ISimpleBankDispatcher { contract_address };

    let name: ByteArray = "Olowo";
    let address: ContractAddress = 'Olowo'.try_into().unwrap();

    let mut spy = spy_events();

    start_cheat_caller_address(contract_address, address);

    contract_dispatcher.open_account(name);
    contract_dispatcher.deposit(U128_MAX);

    assert(contract_dispatcher.get_balance() == U128_MAX, 'Balance Mismatch');

    stop_cheat_caller_address(contract_address);

    let expected_event = Event::DepositMade(DepositMade { amount: U128_MAX, address });
    spy.assert_emitted(@array![(contract_address, expected_event)]);
}

#[test]
#[should_panic(expected: 'Nonexistent Account')]
fn test_deposit_should_panic() {
    let contract_address = setup();
    let contract_dispatcher = ISimpleBankDispatcher { contract_address };

    let address: ContractAddress = 'Olowo'.try_into().unwrap();

    start_cheat_caller_address(contract_address, address);

    contract_dispatcher.deposit(U128_MAX);
}

#[test]
#[fuzzer]
#[should_panic(expected: 'Balance Overflow')]
fn test_deposit_should_overflow(amount: u128) {
    let contract_address = setup();
    let contract_dispatcher = ISimpleBankDispatcher { contract_address };

    let name: ByteArray = "Olowo";
    let address: ContractAddress = 'Olowo'.try_into().unwrap();

    start_cheat_caller_address(contract_address, address);

    contract_dispatcher.open_account(name);
    contract_dispatcher.deposit(U128_MAX);
    contract_dispatcher.deposit(amount + 1);
}

#[test]
#[fuzzer]
fn fuzz_test_deposit(amount: u128) {
    let contract_address = setup();
    let contract_dispatcher = ISimpleBankDispatcher { contract_address };

    let name: ByteArray = "Olowo";
    let address: ContractAddress = 'Olowo'.try_into().unwrap();

    start_cheat_caller_address(contract_address, address);

    contract_dispatcher.open_account(name);
    contract_dispatcher.deposit(amount);

    assert(contract_dispatcher.get_balance() == amount, 'Balance Mismatch');

    stop_cheat_caller_address(contract_address);
}

#[test]
#[fork(url: "https://starknet-mainnet.public.blastapi.io/rpc/v0_8", block_number: 1307232)]
fn test_stark_balance() {
    let binance: ContractAddress = contract_address_const::<
        0x0213c67ed78bc280887234fe5ed5e77272465317978ae86c25a71531d9332a2d,
    >();
    let strk: ContractAddress = contract_address_const::<
        0x04718f5a0fc34cc1af16a1cdee98ffb20c31f5cd61d6ab07201858f4287c938d,
    >();
    let strk_dispatcher = ERC20ABIDispatcher { contract_address: strk };
    let mut bnb_balance: u256 = strk_dispatcher.balance_of(binance);
    assert(bnb_balance > 109691469, 'Balance Mismatch');
}
