pragma solidity ^0.8.7;
// SPDX-License-Identifier: GPL-3.0-or-later

import "hardhat/console.sol";

contract MyContract {


    receive () external payable{}
    fallback () external payable{}

    uint [] arr = [1,2,3,4,5];

    function getArr() public view returns (uint  [] memory) {
        return arr;
    }

    function swap (uint index)  private  {
        //TODO: validate the index
        arr[index] = arr[arr.length-1];
    }

    function removeElement(uint index)  public {
        swap(index);
        arr.pop();
    }

   /* uint public ramu = 45;
    string name = "Faina";

    function setName(string memory newValue) public {
        console.log("before: ", name);
        name = newValue;
        console.log("after: ", name);
    }

    function getSum (uint _a, uint _b)   public pure returns (uint) {
        return (_a + _b);
    }

    function setRamu(uint newValue) public {
        console.log("before: ", ramu);
        ramu = newValue;
        console.log("after: ", ramu);
    }*/


}