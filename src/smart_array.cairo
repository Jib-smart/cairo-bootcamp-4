pub fn array_examp() {
       let mut arr = ArrayTrait::<u128>::new();
    arr.append(20);
     arr.append(24);
      arr.append(28);
       arr.append(22);
    let result = arr.pop_front().unwrap();
    println!("The first value is {}", result);

    let accees_index = 2;
    match arr.get(accees_index) {
        Option::Some(x) => {
           println!("Result is: {}",  *x.unbox())
    
        },
         Option::None => { panic!("out of bounds") },
    }

      let mut arr1 = ArrayTrait::<u128>::new();
    arr1.append(12);
    arr1.append(14);
    let first = arr1.at(1);
    println!("Result is: {}",  *first);

let arr3 = array![1, 2, 3, 4, 5];
}