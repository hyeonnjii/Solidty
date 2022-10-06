// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// 여러개 상속  받을 때
contract Father{
    uint256 public fatherMoney = 100;
    function getFatherName() public pure returns(string memory){
        return "KimJung";
    }
    
    function getMoney() public view virtual returns(uint256){
        return fatherMoney;
    }
    
}

contract Mother{
    uint256 public motherMoney = 500;
    function getMotherName() public  pure returns(string memory){
        return "Leesol";
    }
    function getMoney() public view virtual returns(uint256){
        return motherMoney;
    }
}


contract Son is Father, Mother {
    // 2개의 상속받는 contract의 function 이름이 똑같을 때 override 해줘야 해!
    // 둘다 상속받기 때문에 둘 다 적어줘야 해
    function getMoney() public view override(Father,Mother) returns(uint256){
        return fatherMoney+motherMoney;
    }
}