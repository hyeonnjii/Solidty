// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec3{
    // Gas 단위: 스마트 컨트랙트 사용할 때 지불하는 비용, 공격 막을 수 있는 수단이 되기도
    // 1 ether = 10^9 Gwei = 10^18 wei
    // 0.00000000000000001 ether = 1^-18 = 1 wei
    // 0.01 ether = 10^16 wei
    
    uint256 public value = 1 ether;
    uint256 public value2 = 1 wei;
    uint256 public value3 = 1 gwei;
}