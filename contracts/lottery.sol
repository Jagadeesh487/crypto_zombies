//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract lottery{
    address public manager;
    address payable[] public players;
    address payable public winner;

    constructor(){
        manager = msg.sender;
    }

    function participate() public payable{
        require(msg.value == 1 ether, "you have to pay 1 ether for participation");
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(manager == msg.sender,"you are not the manager");
        return address(this).balance;
    }

    function random() internal view returns(uint){
        //below lone is to generate random number
        //but for now we write like this.. but in real world we use oracle to generate random number
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function pickwinner() public{
        require(manager == msg.sender, "you are not the manager");
        require(players.length >= 3,"players are less then 3");
        uint r = random();
        uint index = r % players.length;
        winner = players[index];
        winner.transfer(getBalance());
        players = new address payable[](0);
    }
}