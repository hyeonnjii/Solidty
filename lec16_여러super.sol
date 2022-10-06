// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// 여러 상속 시 super
contract Father {
    event FatherName(string name);
    function who() public virtual{
        emit FatherName("KimDaeho");
    }
}

contract Mother {
    event MotherName(string name);
    function who() public virtual{
        emit MotherName("leeSol");
    }
}

// 가장 뒤늦게(최신의) 상속된 contract의 emit 을 가져오게 됨
contract Son is Father, Mother{
    
    function who() public override(Father,Mother){
        super.who(); // Mother 이 가장 뒤
    }
}