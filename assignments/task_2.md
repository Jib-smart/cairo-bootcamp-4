# Invoking a Starknet Contract Function Using sncast - 26-03-25

### Objective

The goal of this assignment is to familiarize developers with sncast, a module in Starknet Foundry used to invoke contract functions. Through this assignment, you will learn how to send transactions to a deployed contract using sncast and interpret the response.


### Prerequisites
Before proceeding with this assignment, ensure that you have istalled Starknet Foundry (verify `sncast` by running `sncast --version`). If not, follow the installation guide:
Make sure you also have created and deployed a Starknet account. Find details [here](https://foundry-rs.github.io/starknet-foundry/starknet/account.html)

### Steps
- Interact with all the functions within the `Counter` contract  earlier deployed using `sncast`
- Using the deployed contract's address, interact with the `Counter` contract using sncast
- Counter Contract Address - 0x0070c4689c7c2357a75efb62cadf39ebc0b076c7ac7261d577312ae9fe8a4ac2
- Verify the invocation - after invoking each function, verify the transaction is valid using the generated txn hash

### Assignment Submission
Document the following on hackmd
- The command you executed to invoke the function.
- The transaction hash and the final transaction status.
- Any challenges or observations you encountered while using sncast.
- Screenshots of the terminal output (stdout) for each operation performed

### Resources
- [Starknet Foundry book](https://foundry-rs.github.io/starknet-foundry/starknet/call.html)