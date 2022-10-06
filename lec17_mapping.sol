// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// mapping: 특정 key 넣으면 그에 맞는 value 값 반환하는 것
// key로 value를 구하기 때문에 length 구할 수 없음
contract lec17{
    mapping(string=>uint256) private priceList; // key 타입이 string, value 타입 uint
    mapping(uint256=>string) private nameList;
    mapping(uint256=>uint256) private ageList;
    
    // uint256 _key: 키 값을 입력받음
    // uint256 _age: value 값 입력받음 
    function setAgeList(uint256 _key,uint256 _age) public {
        ageList[_key] = _age; // key, value 정의하기 위해 인덱스 사용
    }
    
    function getAge(uint256 _key) public view returns(uint256){
        return ageList[_key];
    }
    
    function setNameList(uint256 _key,string memory _name) public {
        nameList[_key] = _name;
    }
    
    function getName(uint256 _key) public view returns(string memory){
        return nameList[_key];
    }
    
    function setPriceList(string memory _itemName,uint256 _price) public {
        priceList[_itemName] = _price;
    }
    
    function getPriceList(string memory _key) public view returns(uint256){
        return priceList[_key];
    }
    
}