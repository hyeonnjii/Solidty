// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// linear search: 배열의 값을 검색해서 찾아오기 위해

contract lec24{
    
    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea","North Korea","USA","China","Japan"]; 
    
    
    //Taiwan
    function linearSearch(string memory _search) public view returns(uint256,string memory){
        
        // 원하는 value 값이 있는 인덱스와 value 를 반환하는 함수
        for(uint256 i=0; i<countryList.length; i++){
            // 문자열 비교하기 위해서는 byte 화 한후, 내장함수를 이용하여 hash 화를 해야 해
            // 만약 값이 같다면, 같은 해시값을 가지고 있음
            if(keccak256(bytes(countryList[i])) == keccak256(bytes(_search))){
                return (i,countryList[i]);
            }
        }
        
        return(0,"Nothing");
        
    } 

}