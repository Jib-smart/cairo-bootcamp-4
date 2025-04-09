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

fn reverse_byte_array(word: ByteArray) -> ByteArray {
    word.rev()
}

fn caesar_cipher(word: ByteArray, cipher: u8) -> ByteArray {
    let mut ciphered: ByteArray = "";

    for byte in 0..word.len() {
        let current_char: u8 = word[byte];
        let ciphed_char = if current_char >= 65 && current_char <= 90 {
            (current_char - 65 + cipher) % 26 + 65
        } else if current_char >= 97 && current_char <= 122 {
            (current_char - 97 + cipher) % 26 + 97
        } else {
            current_char
        };
        ciphered.append_byte(ciphed_char);
    }

    ciphered
}

#[cfg(test)]
mod tests {
    use super::{caesar_cipher, is_greater_than_50, reverse_byte_array};

    #[test]
    #[ignore]
    fn test_is_greater_than_50() {
        let values: Array<u32> = array![76, 54, 49, 51, 52];
        for value in values {
            assert!(
                is_greater_than_50(value), "Value: {} is expected to be greater than 50", value,
            );
        }
    }

    #[test]
    fn test_is_greater_than_50_should_fail() {
        let value: u32 = 3;
        let expected: bool = false;
        let got: bool = is_greater_than_50(value);
        assert(got == expected, '3 is not greater than 50');
    }

    #[test]
    fn test_reverse_byte_array() {
        let expected: ByteArray = "lawal";
        let got: ByteArray = reverse_byte_array(expected.clone());
        assert(got == expected, 'lawal is a palindrome');
    }

    #[test]
    fn test_caesar_cipher() {
        let word: ByteArray = "abcdefghijklmnopqrstuvwxyz";
        let cipher: u8 = 26;
        let expected: ByteArray = "abcdefghijklmnopqrstuvwxyz";
        let got: ByteArray = caesar_cipher(word, cipher);
        assert(got == expected, 'Ciphered word should be "Pmpxp"');
    }
}
