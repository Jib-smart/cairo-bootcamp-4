# Cairo Bootcamp 4.0

## Setting Up Starknet Dev Environment with Starkup
- Cairo toolchain installation - tool for installing all the Starknet essentials for development.
- Starkup supports the installation of the following tools:
    - Scarb -  the Cairo package manager
    - Starknet Foundry - the Cairo and Starknet testing framework
    - Universal Sierra Compiler  - compiler for any ever-existing Sierra version
    - Cairo Profiler - profiler for Cairo programming language & Starknet
    - Cairo Coverage - utility for coverage reports generation for code written in Cairo programming language
    - CairoLS - vscode extension
    - [Starkup Github link](https://github.com/software-mansion/starkup)

Install `starkup` using:
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.starkup.sh | sh
```



## Advance Data Type Overview
This serve as a learning resource for Cairo programming language fundamentals. It includes several modules that demonstrate key concepts such as enums, arrays, dictionaries, error handling, and a simple task manager implementation.
Project Structure
The project contains the following modules:

smart_enum: Demonstrates enum usage with pattern matching
smart_array: Shows array implementation and operations
smart_dic: Covers dictionary data structures and usage
smart_dic: Illustrates dictionary implementations and operations
error_handle: Demonstrates error handling techniques in Cairo
task_manager: Implements a simple task management system

### Main Features
Basic Functions
The main module includes several utility functions:

- Smart Enum
This module demonstrates how to use enums with pattern matching in Cairo, including a safe_divide function that returns a DivisionResult enum to handle division operations safely.
- Arrays
The smart_array module shows array implementations and common operations through the array_examp function.
- Dictionaries
The smart_dic module demonstrates dictionary implementations and operations with the basic_dic function.
- Error Handling
The error_handle module illustrates proper error handling techniques in Cairo through the handle_error function.
- Task Manager
The task_manager module implements a simple task management system with the handle_manager function.

### Getting Started
- Prerequisites

Cairo compiler and runtime
Scarb (Cairo package manager), if applicable

Installation

Clone the repository
Build the project with Cairo compiler or Scarb

Usage
Run the project using:
```
scarb cairo-run
```








