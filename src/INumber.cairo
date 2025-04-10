#[starknet::interface]
pub trait INumber<TNothing> {
    fn set_number(ref self: TNothing, amount: u8);
    fn get_number(self: @TNothing) -> u8;
}