import { Protobuf } from "as-proto/assembly";
import { Events as protoEvents } from "./pb/starknet/v1/Events";
import {
    AccountCreated,
    DepositMade,
    WithdrawalMade,
    TransferMade,
    AccountClosed,
} from "../generated/schema";
import { BigInt, log, crypto, Bytes, json } from "@graphprotocol/graph-ts";

export function handleTriggers(bytes: Uint8Array): void {
    const input = Protobuf.decode<protoEvents>(bytes, protoEvents.decode);

    for (let i = 0; i < input.events.length; i++) {
        const event = input.events[i];
        // const eventID = crypto
        //     .keccak256(Bytes.fromUTF8(event.jsonDescription))
        //     .toHexString();

        // let entity = new MyEntity(eventID);
        // entity.save();

        const jsonDescription = json.fromBytes(
            Bytes.fromUTF8(event.jsonDescription)
        );

        if (!jsonDescription) continue;

        const jsonObj = jsonDescription.toObject();

        // Handle AccountCreated event
        if (jsonObj.get("AccountCreated")) {
            const accountCreated = jsonObj.get("AccountCreated")!.toObject();
            const _name = accountCreated.get("name")!.toString();
            const _address = accountCreated.get("address")!.toString();
            const _balanceAsBigInt = accountCreated.get("balance")!.toBigInt();
            const _balance = BigInt.fromString(_balanceAsBigInt.toString());

            // create AccountCreated entity
            const accountCreatedId = crypto
                .keccak256(Bytes.fromUTF8(event.jsonDescription))
                .toHexString();
            let _accountCreated = AccountCreated.load(accountCreatedId);
            if (!_accountCreated) {
                _accountCreated = new AccountCreated(accountCreatedId);
            }

            _accountCreated.name = _name;
            _accountCreated.address = _address;
            _accountCreated.balance = _balance;

            _accountCreated.save();
        }

        // Handle DepositMade event
        if (jsonObj.get("DepositMade")) {
            const depositMade = jsonObj.get("DepositMade")!.toObject();

            const _address = depositMade.get("address")!.toString();
            const _amountAsBigInt = depositMade.get("amount")!.toBigInt();
            const _amount = BigInt.fromString(_amountAsBigInt.toString());

            // create depositMade entity
            const depositMadeId = crypto
                .keccak256(Bytes.fromUTF8(event.jsonDescription))
                .toHexString();
            let _depositMade = DepositMade.load(depositMadeId);
            if (!_depositMade) {
                _depositMade = new DepositMade(depositMadeId);
            }
            _depositMade.address = _address;
            _depositMade.amount = _amount;

            _depositMade.save();
        }

        //Handle WithdrawalMade event
        if (jsonObj.get("WithdrawalMade")) {
            const withdrawalMade = jsonObj.get("WithdrawalMade")!.toObject();

            const _address = withdrawalMade.get("address")!.toString();
            const _amountAsBigInt = withdrawalMade.get("amount")!.toBigInt();
            const _amount = BigInt.fromString(_amountAsBigInt.toString());

            // create withdrawalMade entity
            const withdrawalMadeId = crypto
                .keccak256(Bytes.fromUTF8(event.jsonDescription))
                .toHexString();
            let _withdrawalMade = WithdrawalMade.load(withdrawalMadeId);
            if (!_withdrawalMade) {
                _withdrawalMade = new WithdrawalMade(withdrawalMadeId);
            }
            _withdrawalMade.address = _address;
            _withdrawalMade.amount = _amount;

            _withdrawalMade.save();
        }

        //Handle TrasnferMAde Event

        if (jsonObj.get("TransferMade")) {
            const transferMade = jsonObj.get("TransferMade")!.toObject();

            const _from = transferMade.get("from")!.toString();
            const _to = transferMade.get("to")!.toString();
            const _amountAsBigInt = transferMade.get("amount")!.toBigInt();
            const _amount = BigInt.fromString(_amountAsBigInt.toString());

            // create transferMade entity
            const transferMadeId = crypto
                .keccak256(Bytes.fromUTF8(event.jsonDescription))
                .toHexString();
            let _transferMade = TransferMade.load(transferMadeId);
            if (!_transferMade) {
                _transferMade = new TransferMade(transferMadeId);
            }
            _transferMade.from = _from;
            _transferMade.to = _to;
            _transferMade.amount = _amount;

            _transferMade.save();
        }

        //Handle AccountClosed Event

        if (jsonObj.get("AccountClosed")) {
            const accountClosed = jsonObj.get("AccountClosed")!.toObject();

            const _closed = accountClosed.get("closed")!.toString();
            const _beneficiary = accountClosed.get("beneficiary")!.toString();
            const _amountAsBigInt = accountClosed.get("amount")!.toBigInt();
            const _amount = BigInt.fromString(_amountAsBigInt.toString());

            // create accountClosed entity
            const accountClosedId = crypto
                .keccak256(Bytes.fromUTF8(event.jsonDescription))
                .toHexString();
            let _accountClosed = AccountClosed.load(accountClosedId);
            if (!_accountClosed) {
                _accountClosed = new AccountClosed(accountClosedId);
            }
            _accountClosed.closed = _closed;
            _accountClosed.beneficiary = _beneficiary;
            _accountClosed.amount = _amount;

            _accountClosed.save();
        }
    }
}
