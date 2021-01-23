// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.8.0;

import "./SafeMath.sol";
import "./Ownable.sol";


contract Trustee {
    using SafeMath for uint256;

    address public admin; // Setting admin / owner 
    
    bool isStopped = false; // This variable is specifically created for the Circuit Breaker design pattery. Bool must be false in order for contract to work.
    
    //Struct 
    struct Grantor {
        uint8 id;
        uint256 betSize;
        uint256 pot;
        uint256 start;
        uint256 duration;
        uint256 end;
        string goalStatement;
        address payable staker;
        address payable sponsor;
        address payable judge;
        State state;
        Outcome outcome;
        uint8 tries;
        uint256 sponsorBetBalance;
    }
    
    mapping(uint8 => Goal) public goals; // Mapping to keep track goals set. For simplicity, this contract will only have 1 goal.
    uint8 public goalId; //  Label for each goal set. defualt will be "0", so first goal set wiill be ID "0". For simplicity, this contract will only have 1 goal
    
    constructor() payable public {
        // require(fee > 0 && fee < 100, "fee is a percentage that should be between 1% to 99%");
        dappFee = 5; // Dapp will take 5% of the pot, which is the sum of both stake and sponsor's bet. For simplicity purposes, this contract will not include the Dapp fee.
        admin = msg.sender;
    }
    
    

}