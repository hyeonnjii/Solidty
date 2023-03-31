// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec4{

    /*
    function 이름 () public { // (public, private, internal, external) 접근제어 변경가능.
        // 내용
    }
    */

    uint256 public a = 3; // 기초값
    //1. Parameter 와 return 값이 없는 function 정의 > 5값 a에 대입
    function changeA1() public{
       a=5;
    }

    //2. parameter는 있고, return 값이 없는 function 정의 > parameter type을 결정해줘야 
    function changeA2(uint256 _value) public{
        a =_value;
    }

    //3. parameter는 있고, return 값도 있는 function 정의 > returns! 꼭 붙여주고 type도 넣어줘야 함
    function changeA3(uint256 _value) public returns(uint256){
        a=_value;
        return a;
    }
        


}
