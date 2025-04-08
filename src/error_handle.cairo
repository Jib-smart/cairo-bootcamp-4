fn result(i: u128) -> Result<u128, felt252> {
    if i * 2 == 100 {
        Result::Ok(i * 2)
    } else {
        Result::Err('An Error thrown')
    }
}

pub fn handle_error() {
    // let mut arr = array![2,4,6,8,10];
    // if true {
    //     //panic(arr)
    //     panic!("intentional call for panic");
    // }

    println!("This line isn't reached");

    let smartResult = result(100);

    match smartResult {
        Result::Ok(t) => println!("The Result is: {}", t),
        Result::Err(e) => println!("The Error is: {}", e),
    }
}
