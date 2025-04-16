export const TODO_ABI =[
  {
    "type": "impl",
    "name": "todo_list",
    "interface_name": "todo_list::todo_interface::ITodoList"
  },
  {
    "type": "struct",
    "name": "todo_list::types::Todo",
    "members": [
      {
        "name": "id",
        "type": "core::integer::u64"
      },
      {
        "name": "todo_description",
        "type": "core::felt252"
      },
      {
        "name": "status",
        "type": "core::felt252"
      }
    ]
  },
  {
    "type": "interface",
    "name": "todo_list::todo_interface::ITodoList",
    "items": [
      {
        "type": "function",
        "name": "add_todo",
        "inputs": [
          {
            "name": "todo_description",
            "type": "core::felt252"
          }
        ],
        "outputs": [],
        "state_mutability": "external"
      },
      {
        "type": "function",
        "name": "get_todo_list",
        "inputs": [],
        "outputs": [
          {
            "type": "core::array::Array::<todo_list::types::Todo>"
          }
        ],
        "state_mutability": "view"
      },
      {
        "type": "function",
        "name": "complete_todo",
        "inputs": [
          {
            "name": "todo_id",
            "type": "core::integer::u64"
          }
        ],
        "outputs": [],
        "state_mutability": "external"
      },
      {
        "type": "function",
        "name": "delete_todo",
        "inputs": [
          {
            "name": "todo_id",
            "type": "core::integer::u64"
          }
        ],
        "outputs": [],
        "state_mutability": "external"
      }
    ]
  },
  {
    "type": "constructor",
    "name": "constructor",
    "inputs": []
  },
  {
    "type": "event",
    "name": "todo_list::todo_list::todo_list::Event",
    "kind": "enum",
    "variants": []
  }
] as const