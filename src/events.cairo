use starknet::ContractAddress;

#[derive(Clone, Drop, Debug, starknet::Event)]
    pub struct AccountCreated {
        pub name: ByteArray,
        pub address: ContractAddress,
        pub balance: u64,
    }

    #[derive(Clone, Drop, Debug, starknet::Event)]
    pub struct DepositMade {
        pub amount: u64,
        pub address: ContractAddress,
    }

    #[derive(Clone, Drop, Debug, starknet::Event)]
    pub struct WithdrawalMade {
        pub amount: u64,
        pub address: ContractAddress,
    }

    #[derive(Clone, Drop, Debug, starknet::Event)]
    pub struct TransferMade {
        pub amount: u64,
        pub from: ContractAddress,
        pub to: ContractAddress,
    }

    #[derive(Clone, Debug, Drop, starknet::Event)]
    pub struct AccountClosed {
        pub closed: ContractAddress,
        pub beneficiary: ContractAddress,
        pub amount: u64,
    }