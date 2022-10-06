// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec2{
    
    bool public b = false;
    
    // !(not 연산자), ||, ==, && 
    bool public b1 = !false; //true
    bool public b2 = false || true; //true
    bool public b3 = false == true; //false
    bool public b4 = false && true; //false


    //bytes 
    bytes4 public bt = 0x12345678;
    bytes public bt2 = "STRING"; 

    // address
    address public addr = 0x15e08fa9FE3e3aa3607AC57A29f92b5D8Cb154A2;

    //int vs uint

    //int8
    int8 public it = 4;

    //uint8
    uint256 public uit = 132213; 
}