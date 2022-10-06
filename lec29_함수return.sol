// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec29{
    
    function add(uint256 _num1, uint256 _num2) public pure returns (uint256){
        uint256 total = _num1 + _num2;
        return total;
    }
    
    // return 명을 정의 > 나중에 return 값 많이 있을 수록 덜 헷갈림
    function add2(uint256 _num1, uint256 _num2) public pure returns (uint256 total){
         total = _num1 + _num2;
         return total;
    }
    
}