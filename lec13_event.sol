// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// event 생성 
//> log: info가 블록안에 각인이 되었음  > 언제든지 info 내용 가지고 와 사용할 수 있음
contract lec13 {
   
    event info(string name, uint256 money);
    
    // 돈을 보내는 함수 > 누가 보냈는지에 대한 정보 출력해야 
    function sendMoney() public {
        emit info("KimDaeJin", 1000); // 출력되면 블록안에 저장됨
    }
}