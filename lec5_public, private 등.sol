// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec5{

      /*
    function 이름 () public { // (public, private, internal, external) 변경가능.
        // 내용
    }
    */

    /*
    public: 모든 곳에서 접근 가능
    external: public 처럼 모든 곳에서 접근 가능, but external이 정의된 자기자신 컨트랙 내에서 접근 불가
    private: 오직 private이 정의된 자기 컨트랙에서만 가능(private이 정의된 컨트랙을 상속 받은 자식도 불가능)
    internal: private 처럼 오직 internal이 정의된 자기 컨트랙에서만 가능, internal이 정의된 컨트랙을 상속받은 자식은 가능
    */

    //1. public
    
    uint256 public a = 5;

    //2. private > 우리가 배포한 곳은 smart contract 내가 아니라 밖이기 때문에 a2가 보이지 않음, 접근 불가
    uint256 private a2 = 5;

    /*ex. instance 를 사용하는데, 해당 instance 가 private일 경우 error가 남
    instance는 우리가 다른 contract 에 접근하기 위해서는 접근하려는 contract에 다른 contract을 instance 화 시켜야 함
    
    contract Public_ex {
      unit256 public a = 3;
      
      function changeA(uint256 _value) public {
            a = _value;
       }
    }
    
    contract Public_ex2 {
    
      Public_ex instance = new Public_ex()
      
      function changeA_2(uint256 _value) public {
            instance.changeA(_value);
       }
    // ex. external 함수를 사용하면 다른 함수가 해당 함수를 instance로 사용할 때 가능! 자기자신이 아니니까
    
}

// view vs. pure
