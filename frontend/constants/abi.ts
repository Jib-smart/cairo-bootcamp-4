export const TODO_ABI = [
    {
      "name": "todo_list",
      "type": "impl",
      "interface_name": "todo_list::todo_interface::ITodoList"
    },
    {
      "name": "todo_list::types::Todo",
      "type": "struct",
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
      "name": "todo_list::todo_interface::ITodoList",
      "type": "interface",
      "items": [
        {
          "name": "add_todo",
          "type": "function",
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
          "name": "get_todo_list",
          "type": "function",
          "inputs": [],
          "outputs": [
            {
              "type": "core::array::Array::<todo_list::types::Todo>"
            }
          ],
          "state_mutability": "view"
        },
        {
          "name": "complete_todo",
          "type": "function",
          "inputs": [
            {
              "name": "todo_index",
              "type": "core::integer::u64"
            }
          ],
          "outputs": [],
          "state_mutability": "external"
        },
        {
          "name": "delete_todo",
          "type": "function",
          "inputs": [
            {
              "name": "todo_index",
              "type": "core::integer::u64"
            }
          ],
          "outputs": [],
          "state_mutability": "external"
        }
      ]
    },
    {
      "name": "constructor",
      "type": "constructor",
      "inputs": []
    },
    {
      "kind": "enum",
      "name": "todo_list::todo_list::todo_list::Event",
      "type": "event",
      "variants": []
    }
  ] as const