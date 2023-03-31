// SPDX-License-Identifier: GPL-3.0 

// GPL 라이선스: 기본적으로 배포하는 순간 내 소스코드 공개, 어디서 가져왔는지 명시해야 
// MIT, Apache, BSD: 가져다 써도 되고 공헌 하지 않아도 됨, but 출처는 공개해야 
pragma solidity >= 0.7.0 < 0.9.0;

contract Hello{
    // contract 에는 print function이 없어서 log를 주로 사용함
    string public hi ="Hello solidity";
}

contract lec2{
    //data type
    //boolean, bytes, address, uint

    //reference type
    //string, Arrays, struct

    //mapping type

    //boolean:true/false
    //public : 접근제한자
    bool public b = false;
    
    //!(not 연산자) || ==&& 
    bool public b1 = !false; //true
    bool public b2 = false || true; //true
    bool public b3 = false == true; //false
    bool public b4 = false && true; //false


    //bytes 1~32까지 저장가능
    bytes4 public bt = 0x12345678; //2개면 1byte 
    bytes public bt2 = "STRING"; //STRING을 넣을 수도 있음 > STRING이 몇바이트인지 볼 수 있음

    //address
    //compile 후 deploy로 contract 가 배포가 되면 address 부여받음
    //이것으로 address 확인할 수 있음
    address public addr = 0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47; // 20byte 길이가 총 40개

    //int vs uint

    //int8
    //-2^7 ~ 2^7 -1까지
    int8 public it = 4;

    //uint8
    //부호 없어서 보통은 이것을 많이 씀
    //0 ~ 2^8-1
    uint256 public uit = 132213; // 제일 크기때문에 256을 제일 많이 씀
}
