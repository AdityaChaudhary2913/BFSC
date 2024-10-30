// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract{
    // uint value public = 1; wrong
    // uint is short form for uint256
    int value;

    string str = "Hello World!";
    bytes32 str2 = "Hello World!";

    address adr;

    struct MyStruct {
        uint256 val1;
        string val2;
    }

    MyStruct public myStruct = MyStruct(1, "Aditya");

    function getValue() public pure returns(uint) {
        // Local Variable
        uint val = 1;
        return val;
    }

    //Arrays
    uint[] public arr = [1, 2, 3];

    function append(uint value1) public {
        arr.push(value1);
    }

    //Mappings
    mapping (uint => string) public names;

    mapping (uint => Book) public books;

    mapping (address => mapping (uint => Book)) public myBooks;

    struct Book{
        string title;
        string author;
    }

    address public owner;

    constructor() {
        owner = msg.sender;
        names[1] = "Aditya";
        names[2] = "Tushar";
    }

    function addBook(uint id, string memory title, string memory author) public {
        books[id] = Book(title, author);
    }

    function addMyBook(uint id, string memory title, string memory author) public {
        myBooks[msg.sender][id] = Book(title, author);
    }

    // Conditionals and Loops
    uint[] public nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    function isEven(uint num) public pure returns(bool){
        if (num % 2 == 1) {
            return false;
        }   else {
            return true;
        }
    }

    function countEvens(uint[] memory numbers) public pure returns(uint){
        uint count = 0;
        
        for (uint i=0; i<numbers.length; i++){
            if(isEven(numbers[i])){
                count ++; 
            }
        }

        return count;
    }
}