pragma solidity ^0.5.0;

contract Enrollment{
enum  Registration{
    online,
    onsite
}
enum Gender{
    male,
    female
}
struct StudentData{
   string name;
   uint8 age;
   uint rollNumber;
   Gender gender;
   bool isBsDegree;
   Registration registration;
}
mapping(address=>StudentData) studentRecord;
address payable private myAddress = 0xaD335c3c503aBd738Af9a7690FB41f9fadcBE91A;
event sucessfullEnrollment(string, string, string, address, string, uint8, string, uint, string, bool, string);

    function enrollStudent(string memory name, uint8 age, uint rollNumber, uint8 gender, bool isBsDegree, uint8 registration) public payable{
        require(msg.sender != address(0), "Invalid Address");
        require(msg.value == 2 ether, "2 ethers needed for enrollment");
        myAddress.transfer(msg.value);
        emit sucessfullEnrollment("Mr. ",name," having an address ",msg.sender,"  aged ",age," is registered with a rollNumber ",rollNumber," and it is ", isBsDegree," that this student as BS degree is registered in the program.");
    }
    function getBalance() public view returns(uint){
        return myAddress.balance;
    }
    function noOfStudentsEnrolled() public view returns(uint){
        return (myAddress.balance/2000000000000000000);
    }
}