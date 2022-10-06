// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//instance 사용 > gas 많이 사용하게 됨
contract A{
    
    string public name;
    uint256 public age;
    
    // 이 A라는 contract를 쓰기 위해 constructor 을 무조건 먼저 지정해줘야 !!
    constructor(string memory _name, uint256 _age){
        name = _name;
        age = _age;
    }
        
    function change(string memory _name, uint256 _age) public  {
         name = _name;
         age = _age;
    }
}

contract B{
    
  A instance = new A("Alice", 52);
  
  function change(string memory _name, uint256 _age) public  {
        instance.change(_name,_age);
    }
  
  function get() public view returns(string memory, uint256) {
        return (instance.name(), instance.age());
    }

}