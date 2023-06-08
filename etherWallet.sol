//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract  etherWallet{
    address owner = msg.sender;

    function Owner() view public returns(address){
        return owner ;
    }

    receive() external payable{}

    function withdrawAmount(uint _value) external{
        require (msg.sender == owner, "owner is not withdrawing the amount");
        payable(msg.sender).transfer(_value);
    }

    function balance() public view returns(uint){
        return address(this).balance;
    }
}