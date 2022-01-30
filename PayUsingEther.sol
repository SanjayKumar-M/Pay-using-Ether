// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Payment{

    struct Sender_Details{
        string name;
        address yaddress;
        uint256 amount;

    }

    struct Reciever_Details{
        string r_name;
        address recieveraddress;
        
    }
    Reciever_Details r;

    Sender_Details d;


    mapping(address => uint256) public Pay;

    function Input(string memory YourName,address YourAddress,uint256 Amount,string memory Reciever,address R_address) public{

        d.name =YourName;
        d.yaddress = YourAddress;
        d.amount = Amount;
        r.r_name = Reciever;
        r.recieveraddress = R_address;
    } 

    function CheckDetails()public view returns(string memory,address,address){

        return(d.name,d.yaddress,r.recieveraddress);
    }


    modifier condition(){

        require(msg.sender == r.recieveraddress,"Enter correct address");
        _;
    }



    function PayAmount() public condition payable{

        Pay[msg.sender] += msg.value;
    }
}
