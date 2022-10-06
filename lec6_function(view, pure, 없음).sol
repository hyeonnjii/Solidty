// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

    /*
    function 이름 () public { // (public, private, internal, external) 변경가능.
        // 내용
    }
    */

    /*
    function get_a() external view returns (uint256)
    */

    /*
    view : function 밖의 변수들을 읽을수 있으나 변경 불가능
    pure : function 밖의 변수들을 읽지 못하고, 변경도 불가능
    viwe 와 pure 둘다 명시 안할때: function 밖의 변수들을 읽어서, 변경을 해야함.이 정의된 현재 이 컨트랙을 상속받은 자식 컨트랙도 접근가능)
    */

contract lec6{
     uint256 public a = 1;
    
    function viewExample() public view returns(uint256){
        return a+2;
    } // a 값을 변경하지 않고 +2 해서 보여주겠다
    
    function readAndChangeA() public returns(uint256){
        a = 3;
        return a+2;
    } // 여기 a는 밖에서도 3으로 변경됨

    function pureExample() pure public returns(uint256){
        uint256 a2 = 3;
        return a2+2;
    } // function 밖의 변수 읽지 못하기 때문에 함수안에 변수 설정해줘야 
    
}