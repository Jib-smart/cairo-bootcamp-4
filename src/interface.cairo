use crate::BankAccount;
use starknet::ContractAddress;

#[starknet::interface]
pub trait ISimpleBank<TContractState> {
    fn open_account(ref self: TContractState, name: felt252);
    fn deposit(ref self: TContractState, amount: u64);
    fn withdraw(ref self: TContractState, amount: u64);
    fn transfer(ref self: TContractState, amount: u64, recipient: ContractAddress);
    fn close_account(ref self: TContractState, beneficiary: ContractAddress);
    fn get_balance(self: @TContractState) -> u64;
    fn get_account_details(self: @TContractState) -> BankAccount;
}
