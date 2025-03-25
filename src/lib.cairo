/// Interface representing `HelloContract`.
/// This interface allows modification and retrieval of the contract count.
#[starknet::interface]
pub trait ICounter<TContractState> {
    /// Increase contract count.
    fn increase_count(ref self: TContractState, amount: felt252);
    /// Increase contract count by one
    fn increase_count_by_one(ref self: TContractState);

    /// Decrease contract count.
    fn decrease_count(ref self: TContractState, amount: felt252);

    /// Decrease contract count.
    fn decrease_count_by_one(ref self: TContractState);
    /// Retrieve contract count.
    fn get_count(self: @TContractState) -> felt252;
}

/// Simple contract for managing count.
#[starknet::contract]
mod Counter {
    use starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};

    #[storage]
    struct Storage {
        count: felt252,
    }

    #[abi(embed_v0)]
    impl CounterImpl of super::ICounter<ContractState> {
        fn increase_count(ref self: ContractState, amount: felt252) {
            assert(amount != 0, 'Amount cannot be 0');
            self.count.write(self.count.read() + amount);
        }

        fn increase_count_by_one(ref self: ContractState) {
            self.count.write(self.count.read() + 1);
        }


        fn decrease_count(ref self: ContractState, amount: felt252) {
            assert(amount != 0, 'Amount cannot be 0');
            self.count.write(self.count.read() - amount);
        }

        fn decrease_count_by_one(ref self: ContractState) {
            self.count.write(self.count.read() - 1);
        }

        fn get_count(self: @ContractState) -> felt252 {
            self.count.read()
        }
    }
}
