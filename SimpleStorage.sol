// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; 

contract SimpleStorage {

    uint256 ID; //this gets initialized to zero
    //People public person = People({ID: 3 , name: "patrick"});

    struct People {
        uint256 ID;
        string name;
    }

    mapping (string => uint256) public nameToID; 

    //uint256[] public IDList // array;
    People[] public people; 

    function store(uint256 _ID) public virtual {
        ID= _ID;
    }
    
    //view or pure functions won't cost gas unless they are called by the contract. 
    function retrieve() public view returns (uint256){
        return ID;
    }

    function addPeople(string memory _name, uint256 _ID) public {
        People memory newperson = People({ID: _ID, name: _name});
        people.push(newperson);

        //short version is given below
       // people.push(People(_ID, _name));

       nameToID[_name] = _ID;

    }
}
