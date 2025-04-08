use core::dict::Felt252Dict;

pub fn basic_dic() {
    let mut balances: Felt252Dict<u128> = Default::default();

    balances.insert('Bob', 40);

    balances.insert('Alex', 20);

    balances.insert('Doe', 30);

    balances.insert('John', 10);
    let mut alex_balance = balances.get('Alex');
    println!("Alex Blance: {} ", alex_balance);

    balances.insert('Alex', 100);
    // assert!(alex_balance == 100, "Balance is not 100");

    alex_balance = balances.get('Alex');
    println!("Alex Blance after update: {} ", alex_balance);
}

