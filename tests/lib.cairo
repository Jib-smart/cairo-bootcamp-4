mod test_account_creation;
mod test_deposit;
use cohort_4::SimpleBank::{AccountCreated, DepositMade, Event};
use cohort_4::interface::{ISimpleBankDispatcher, ISimpleBankDispatcherTrait};
use core::num::traits::Bounded;
use openzeppelin_token::erc20::{ERC20ABIDispatcher, ERC20ABIDispatcherTrait};
use snforge_std::{
    ContractClassTrait, DeclareResultTrait, EventSpyAssertionsTrait, declare, spy_events,
    start_cheat_caller_address, stop_cheat_caller_address,
};
use starknet::{ContractAddress, contract_address_const};

fn setup() -> ContractAddress {
    let contract_class = declare("SimpleBank").unwrap().contract_class();
    let (contract_address, _) = contract_class.deploy(@array![]).unwrap();
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
    assert!(
        contract_instance.get_balance() == 730,
        "Transfer Failed: {}",
        contract_instance.get_balance(),
    );
    stop_cheat_caller_address(contract_address);

    start_cheat_caller_address(contract_address, other_address);
    assert!(contract_instance.get_balance() == 120, "Account Creation Failed");
    stop_cheat_caller_address(contract_address);
}
