use super::*;

#[test]
fn test_account_created() {
    let contract_address = setup();
    let contract_dispatcher = ISimpleBankDispatcher { contract_address };

    let name: ByteArray = "Olowo";
    let address: ContractAddress = 'Olowo'.try_into().unwrap();

    start_cheat_caller_address(contract_address, address);

    contract_dispatcher.open_account(name);
    assert(contract_dispatcher.get_balance() == 0, 'Balance Mismatch');
    assert(contract_dispatcher.get_account_details().opened, 'Account Creation Failed');

    stop_cheat_caller_address(contract_address);
}

#[test]
fn test_account_created_should_emit() {
    let contract_address = setup();
    let contract_dispatcher = ISimpleBankDispatcher { contract_address };

    let name: ByteArray = "Olowo";
    let address: ContractAddress = 'Olowo'.try_into().unwrap();

    let mut spy = spy_events();

    start_cheat_caller_address(contract_address, address);

    contract_dispatcher.open_account(name.clone());
    assert(contract_dispatcher.get_balance() == 0, 'Balance Mismatch');
    assert(contract_dispatcher.get_account_details().opened, 'Account Creation Failed');

    stop_cheat_caller_address(contract_address);

    let expected_event = Event::AccountCreated(AccountCreated { name, address, balance: 0 });
    spy.assert_emitted(@array![(contract_address, expected_event)]);
}
