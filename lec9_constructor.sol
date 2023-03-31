// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;


// 생성자(constructor): 변수의 값을 초기화 할 때, smart contract 이 처음 생성 or instance 화 될 때
// 초기 파라미터 값을 받고 스마트 컨트랙이 생성됨

//instance 사용 > gas 많이 사용하게 됨
contract A{
    
    //2개의 변수
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
    
  A instance = new A("Alice", 52); // 위에서 parameter 필요> instance 지정하면서 parameter 값을 넣어줘야 함 
  
  function change(string memory _name, uint256 _age) public  {
        instance.change(_name,_age);
    }
  
  function get() public view returns(string memory, uint256) {
        return (instance.name(), instance.age()); // 이렇게 여러개의 return 값 반환할 수 있
    }

}
