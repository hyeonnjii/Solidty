// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;
/*
Call vs Delegate call

Delegate call: 
1. msg.sender 가 제일 본래의 스마트컨트랙 사용자(Alice)를 나타낸다 
2. delegate call이 정의된  스마트 컨트랙(즉caller, 예시는 스컨A)이 외부 컨트랙(스컨 B)의 함수들(원래는 스컨 B것)들 마치 자신의 것(스컨 A에서 해당 함수가 실행) 처럼 사용(실질적인 값도 caller에 저장) 

<조건> 
외부 스마트컨트랙과 caller 스마트컨트랙은 *같은 변수를 갖고 있어야 한다.   
> why?
upgradable smart contract 용도 
*/
// 스마트 컨트랙트 내용 바꾸고 싶을 때, 아예 새로운 것을 생성해서 그것과 연결시켜



contract add{
    uint256 public num = 0;
    event Info(address _addr,uint256 _num);
    
    function plusOne() public {
        num = num + 1;
        emit Info(msg.sender,num);
    }
    

    
}

contract caller{
    uint256 public num = 0;
    function callNow(address _contractAddr) public payable{
        (bool success,) = _contractAddr.call(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to transfer ether");
    }

    
    function delcateCallNow(address _contractAddr) public payable{
        (bool success,) = _contractAddr.delegatecall(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to transfer ether");
    }
}