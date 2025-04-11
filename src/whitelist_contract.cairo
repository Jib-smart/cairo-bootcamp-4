#[starknet::contract]
mod WhitelistedContract {
    use starknet::get_caller_address;
    use crate::whitelist_component::WhitelistComponent;

    component!(path: WhitelistComponent, storage: whitelist, event: WhitelistEvent);

    #[abi(embed_v0)]
    impl WhitelistImpl = WhitelistComponent::WhitelistComponent<ContractState>;
    impl InternalImpl = WhitelistComponent::InternalImpl<ContractState>;

    #[storage]
    pub struct Storage {
        #[substorage(v0)]
        whitelist: WhitelistComponent::Storage,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    pub enum Event {
        WhitelistEvent: WhitelistComponent::Event,
    }

    #[constructor]
    fn constructor(ref self: ContractState) {
        let deployer = get_caller_address();
        self.whitelist.initializer(deployer);
    }

    #[external(v0)]
    fn whitelisted_function(ref self: ContractState) -> felt252 {
        // Only whitelisted addresses can call this function
        let caller = get_caller_address();
        assert(self.whitelist.is_whitelisted(caller), 'Caller is not whitelisted');

        'success'
    }
}
