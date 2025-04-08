mod smart_enum;
mod smart_array;
mod smart_dic;
mod error_handle;
mod task_manager;

fn main() {
    // Function calls (Uncomment to execute them)
    // say_name("Sylvia Nnoruka!");
    // intro_to_felt();

    let num_1 = 5;
    let num_2 = 10;
    let sum = sum_num(num_1, num_2);
    println!("The sum of {} and {} is = {}", num_1, num_2, sum);

    // check_u16(6553); // Uncomment if needed
    is_greater_than_50(3);

    // examples of how to used enum with pattern matching
    let resut1 = smart_enum::safe_divide(8, 2);
    match resut1 {
        smart_enum::DivisionResult::Ok(value) => println!("result value is: {}", value),
        smart_enum::DivisionResult::Err(err) => println!("Error Result is: {}", err)
    }

    // Function that demostrate Array usage
    smart_array::array_examp();

    // Function that demostrate Dictionaries
    smart_dic::basic_dic();

    // Function that demostrate Error handling in cairo
    error_handle::handle_error();

    // A simple Task Manager program in Cairo
    task_manager::handle_manager()
}

// DATA TYPES IN CAIRO
// - felts: felt252 (Field elements)
// - ByteArray: Represents a sequence of bytes
// - Integers:
//   - Signed: i8, i16, i32, i64, i128, i256
//   - Unsigned: u8, u16, u32, u64, u128, u256
// - Boolean: bool

// Function to demonstrate ByteArray usage
fn say_name(x: ByteArray) {
    println!("{}", x);
}

// Function to demonstrate felt252 usage
fn intro_to_felt() {
    let x = 40000;
    println!("{}", x);
}

// Function to sum two u8 integers
fn sum_num(x: u8, y: u8) -> u8 {
    return x + y;
}

// Function to print a u16 integer
fn check_u16(x: u16) {
    println!("{x}");
}

// Function to check if a u32 integer is greater than 50
fn is_greater_than_50(x: u32) -> bool {
    if x > 50 {
        println!("true");
        return true;
    }
    println!("false");
    return false;
}
