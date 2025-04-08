#[derive(Drop)]    
enum TaskStatus {
Pending,
IN_PROGRESS,
COMPLETED,
}
#[derive(Drop)]
enum Direction {
    North: u128,
    East: u128,
    South: u128,
    West: u128,
}
#[derive(Drop)]
enum Grade<u64> {
   Good: u64,
   Fail: u64,
   None, 
}
// enum Option<T> {
//     Some: T,
//     None,
// }
  

fn get_user(id: u32) -> Option<felt252> {
    if id == 5 {
        Option::Some('Smart Pointer')
    } else {
        Option::None
    }
}

#[derive(Drop)]
pub enum DivisionResult {
    Ok: u64,
    Err: felt252,
}

pub fn safe_divide(a: u64, b: u64) -> DivisionResult {
    if b == 0 {
        DivisionResult::Err('Cannot divide by zero')
    } else {
        // Note: Cairo doesn't have native floating point support
        // Using integer division instead
        DivisionResult::Ok(a / b)
    }
}
