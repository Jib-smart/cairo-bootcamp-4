use core::dict::Felt252Dict;
pub fn handle_manager() {
        let mut task_manager: Felt252Dict<u8> = Default::default();
    
    // Add tasks with a priority level
    add_task('Buy groceries', 2, ref task_manager);
    add_task('Finish project', 1, ref task_manager);
    add_task('Call mom', 3, ref task_manager);
    
    // Complete a task
    add_task('Buy groceries', 2, ref task_manager);
    update_task('Buy groceries', 10, ref task_manager);
    
    get_task_priority('Buy groceries', ref task_manager);

    delete_task('Finish project', ref task_manager);

     get_task_priority('Finish project', ref task_manager);
}


fn add_task(name: felt252, priority: u8, ref task_manager: Felt252Dict<u8>){
    task_manager.insert(name, priority);
    println!("Task Added: {}", name);
}

fn update_task(name: felt252, new_priority: u8, ref task_manager: Felt252Dict<u8>){
task_manager.insert(name, new_priority);
println!("Task  Updated: {}", name);
}

fn get_task_priority(name: felt252, ref task_manager: Felt252Dict<u8>) {
    let priority = task_manager.get(name);
    println!("Task with name: {} has a priority level of: {}", name, priority);
}

fn delete_task(name: felt252, ref task_manager: Felt252Dict<u8>){
    task_manager.insert(name, 0);
    println!("Task  Deleted: {}", name);
}
// task manager where we can 
// add task
// update task priority level
// get task
// delete task
