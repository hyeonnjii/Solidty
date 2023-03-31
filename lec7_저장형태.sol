// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
storage : 대부분의 변수, 함수들이 저장되며, 영속적으로 저장이되어 가스 비용이 비싸요 
> function 밖에 설정 function 안에서도 살아있음

memory: 함수의 파라미터, 리턴값, 레퍼런스 타입이 주로 저장이 됩니다.
그러나, storage 처럼 영속적이지 않고, 함수내에서만 유효하기에 storage보다 가스 비용이 싸답니다.

Colldata : 주로 external function 의 파라메터에서 사용 됩니다.

stack:  EVM (Ethereum Virtual Machine) 에서 stack data를 관리할때 쓰는 영역인데 1024Mb 제한적입니다.이 컨트랙을 상속받은 자식 컨트랙도 접근가능)
*/

//string은 기본 데이터 타입이 아니라서, memory 라는 키워드를 붙여줘야 해> 저장 형태 정해줘야 해
//저장에 따라 gas값이 달라지기 때문

contract lec7 {
    
    function get_string(string memory _str) public pure returns(string memory){
        return _str;
    }
}

// uint 의 경우는 기본 데이터 타입이기 때문에 memory 가 default 값으로 설정이 되있기 때문에
// 따로 설정안해도 됨(memory는 default 값으로 되어있기 때문에 굳이 안넣어도 deploy 되긴 함)
