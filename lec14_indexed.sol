// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

// indexed : event 내에서만 사용할 수 있는 keyword
// 특정한 event의 값을 들고 올 때 사용
contract lec14  {
    // indexed > 원하는 event 값 filter 해서 가지고 올 수 있음
    event numberTracker(uint256 num, string str); 
    event numberTracker2(uint256 indexed num, string str);

    uint256 num =0;
    function PushEvent(string memory _str) public {
        emit numberTracker(num,_str);
        emit numberTracker2(num,_str);
        num ++;
    }
}

// getPastEvents를 사용해 가지고 올 수 있음