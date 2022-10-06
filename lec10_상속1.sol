// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// 상속(모 contract 의 function, 변수 사용가능)

contract Father{
    string public familyName = "Kim";
    string public givenName = "Jung";
    uint256 public money = 100; 
    
    // 상속할 때는 자식 contract 가 새로 채워 넣어야 해
    constructor(string memory _givenName) public {
        givenName = _givenName;
    }
    
    
    function getFamilyName() view public  returns(string memory){
        return familyName;
    } 
    
    function getGivenName() view public  returns(string memory){
        return givenName;
    } 
    
    function getMoney() view public returns(uint256){
        return money;
    }
    

}

// 아빠 껄 아들한테 상속(function, 변수 접근 가능)
// given name이 james로 변겨됨
contract Son is Father("James"){
    
  

} 