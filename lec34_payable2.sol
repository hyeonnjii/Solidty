// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

// payable을 생성자 constructor에 넣을때
// 특정 주소에게만 권한 주기


contract MobileBanking{
    
    address owner;  // 특정 주소에게만 권한 주기

    // 배포될 때 해당 smartcontract 가 ether 을 얻을 수 잇게 됨
    constructor() payable{
        owner = msg.sender;  // 배포할 때, 배포한 주소를 owner 
    }
    
    modifier onlyOwner{
        require(msg.sender == owner, "Only Owner!");
        _;
    }
    
    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to,uint256 _value);
   
    function sendEther(address payable _to) public onlyOwner payable {
        // 해당 줄을 위에 modifier 로 넣을 수 있음
        //require (msg.sneder == owner, "Only Owner!") // 오너만 이 함수를 사용할 수 있게 됨
        require(msg.sender.balance>=msg.value, "Your balance is not enough");
        _to.transfer(msg.value);    
        emit SendInfo(msg.sender,(msg.sender).balance);
    }
    
    function checkValueNow() public onlyOwner {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }
    
    function checkUserMoney(address _to) public onlyOwner {
        emit CurrentValueOfSomeone(msg.sender,_to ,_to.balance);
    }
    
}