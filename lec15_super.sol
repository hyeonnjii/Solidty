// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//who
contract Father {
    event FatherName(string name);
    function who() public virtual{
        emit FatherName("KimDaeho"); // 출력이 여러개 일 경우 >  super.함수명을 쓰는 것이 효과적
    }
}


contract Son is Father{
    event sonName(string name);
    function who() public override{
        super.who(); // emit FatherName("KimDaeho"); 상속받는 곳의 emit을 전부 가져오겠다!
        emit sonName("KimJin");
    }
}