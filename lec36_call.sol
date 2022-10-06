// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;
/*
call :로우레벨 함수 
1. 송금하기
2. 외부 스마트 컨트랙 함수 부르기 
3. 가변적인 gas 소비(<-> transfer, send 2300gas만)
4. 이스탄불 하드포크, 2019년 12월이후, gas 가격 상승에 따른,  call 사용 권장(가스 부족할 수 있기 때문)/ send tranfer = 2300gas 
5. call을 사용하면 re-entrancy(재진입) 공격위험 있기에, Checks_Effects_Interactions_pattern 사용  
*/



contract add{
    event JustFallback(string _str);
    event JustReceive(string _str);
    function addNumber(uint256 _num1, uint256 _num2) public pure returns(uint256){
        return _num1 + _num2;
    }
    //caller 가 add contract에 없는 함수를 불렀을 경우, fall 함수를 실행할 것
    fallback() external payable  {
     emit JustFallback("JustFallback is called");
    }
    receive() external payable {  // add 라는 contract이 receive 를 통해 이더를 받을 수 있음
    // 따라서 payable 이 붙음
     emit JustReceive("JustReceive is called");
    }
}


contract caller{
    event calledFunction(bool _success, bytes _output);
   
    //1. 송금하기 (call 함수 사용)
    function transferEther(address payable _to) public payable{
        (bool success,) = _to.call{value:msg.value}("");
        require(success,"failed to transfer ether");
    }
    
    //2. 외부 스마트 컨트랙 함수 부르기 
    // callmethod 3가지 파라미터: add 컨트랙트 address 주소가 필요(거기의 함수를 부르려고 하기 때문)
    // 해당 부르려는 함수의 파라미터2 개 그대로 가지고 와
    function callMethod(address _contractAddr,uint256 _num1, uint256 _num2) public{
        
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call(
             abi.encodeWithSignature("addNumber(uint256,uint256)",_num1,_num2)
            );  // abi.encode- 라는 함수를 사용하여 외부 함수 부를 수 있음)
            // 원래는 value:msg.value 이렇게 사용 > 이더 보낼 때
              
        require(success,"failed to transfer ether");
        emit calledFunction(success,outputFromCalledFunction);
    }
    
    // 이더를 보내면서 없는 함수를 실행시킴 > 위에서 이더 받지만, fallback 함수가 실행됨
    function callMethod3(address _contractAddr) public payable{
        
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call{value:msg.value}(
             abi.encodeWithSignature("Nothing()")
            );
              
        require(success,"failed to transfer ether");
        emit calledFunction(success,outputFromCalledFunction);
    }
}