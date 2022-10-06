// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// modifier: 함수변경자 > 함수의 동작을 변경시키기 위해 
// 즉, modifier 를 사용하여 함수 실행시키기 전, 후에 특정한 기능을 추가로 할 수 있도록


contract lec30{
    
    // 이 modifier 로 함수실행되기 전 바로 revert 에러가 나게 끔 함
    modifier onlyAdults{
         revert("You are not allowed to pay for the cigarette");
         _; // 함수가 들어갈 자리
    } 
    
    function BuyCigarette() public onlyAdults returns(string memory){
        return "Your payment is succeeded";
    }
    
    // 파라미터값이 있는 경우
    modifier onlyAdults2(uint256 _age){
        // 파라미터 값 조건문 판단하여 에러냄
         require(_age>18,"You are not allowed to pay for the cigarette");
         _;
    }
    
    function BuyCigarette2(uint256 _age) public onlyAdults2(_age) returns(string memory){
        return "Your payment is succeeded";
    }
    
     

    uint256 public num = 5;
    modifier numChange{
        num = 10;
         _;
        
    }
    function numChangeFunction() public numChange{
        num = 15;
    }
}