// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract todolist{
    struct Todo{
        string text;
        bool completed;
    }

    Todo[] todos;

    function create(string memory _text) external {
        todos.push(Todo({
            text : _text,
            completed : false
        }));
    }

    function updateTodo(string calldata _text, uint _index) external {
        todos[_index].text = _text; //arrays->index->struct(todo)->text
        Todo storage todo = todos[_index]; 
        todo.text = _text;
    }

    function read(uint _index) external view returns(string memory, bool, address){
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed, msg.sender);
    }

    function toggleCompleted(uint _index) external{
        todos[_index].completed = !todos[_index].completed;
    }
}