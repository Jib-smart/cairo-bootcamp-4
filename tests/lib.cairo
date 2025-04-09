use cohort_4::{ISimpleBankDispatcher, ISimpleBankDispatcherTrait};
use snforge_std::{
    ContractClassTrait, DeclareResultTrait, declare, start_cheat_caller_address,
    stop_cheat_caller_address,
};
use starknet::ContractAddress;

fn setup() -> ContractAddress {
    let contract_class = declare("SimpleBank").unwrap().contract_class();
    //let mut constructor_calldata: Array<felt252> = ArrayTrait::new();
    //let owner: ContractAddress = 'Darren'.try_into().unwrap();
    //let value: u128 = 1000;

    //owner.serialize(ref constructor_calldata);
    //value.serialize(ref constructor_calldata);
    let (contract_address, _) = contract_class.deploy(@ArrayTrait::new()).unwrap();
    contract_address
}

#[test]
fn test_simple_bank() {
    let contract_address = setup();
    let contract_instance = ISimpleBankDispatcher { contract_address };

    let name: ByteArray = "Darren";
    let address: ContractAddress = 'Darren'.try_into().unwrap();

    start_cheat_caller_address(contract_address, address);

    contract_instance.open_account(name);
    assert!(contract_instance.get_balance() == 0, "Account Creation Failed");

    contract_instance.deposit(1000);
    assert!(contract_instance.get_balance() == 1000, "Deposit Failed");

    contract_instance.withdraw(150);
    assert!(contract_instance.get_balance() == 850, "Deposit Failed");

    stop_cheat_caller_address(contract_address);

    let other_name: ByteArray = "Derrick";
    let other_address: ContractAddress = 'Derrick'.try_into().unwrap();

    start_cheat_caller_address(contract_address, other_address);

    contract_instance.open_account(other_name);
    assert!(contract_instance.get_balance() == 0, "Account Creation Failed");

    stop_cheat_caller_address(contract_address);

    start_cheat_caller_address(contract_address, address);
    contract_instance.transfer(120, other_address);
    assert!(contract_instance.get_balance() == 730, "Transfer Failed");
    stop_cheat_caller_address(contract_address);

    start_cheat_caller_address(contract_address, other_address);
    assert!(contract_instance.get_balance() == 120, "Account Creation Failed");
    stop_cheat_caller_address(contract_address);
}
