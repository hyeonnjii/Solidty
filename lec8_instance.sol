// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// instance 쓰는 이유: 하나의 contract 에서 다른 contract을 접근할 때 사용
// B에서 A를 사용함
contract A{
    
    uint256 public a = 5;
    
    function change(uint256 _value) public {
        a = _value;
    } 

}

contract B{
    
    A instance_1 = new A(); // instance 정의 
    
    function get_A() public view returns(uint256) {
        return instance.a(); // A의 a 변수에 접근만 하니까 view 사용
    }
    function change_A(uint256 _value) public  {
        instance_1.change(_value);  // change 함수를 사용해서 a값을 바꿔줌
        // A 컨트랙트의 change function을 사용
    }    

}
