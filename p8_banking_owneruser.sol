// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;


// 다른 sol import 후 > 상속
import "./accesscontrol.sol";

library Mapping {
    
    function Add(mapping(address => uint256) storage _map, address _account, uint256 _money) external {
        _map[_account] += _money;
    }

    function Sub(mapping(address => uint256) storage _map, address _account, uint256 _money) external {
        require(_map[_account] - _money > 0, "negative balance");
        _map[_account] -= _money;
    }
}

contract Bank is AccessControl{
    
    // Mapping library 사용 > using 'library 이름' for 사용함수의 첫인자 type 
    using Mapping for mapping(address => uint256);

    event CheckMoney(address owner,uint256 balance);

    mapping(address => uint256) public balance;
    
    function sendMoney() external payable onlyUser {
        balance.Add(msg.sender, msg.value);
        emit CheckMoney(msg.sender, balance[msg.sender]);
    }

    function drawMoney(uint256 _withdrawMoney) external payable onlyUser {
        balance.Sub(msg.sender, _withdrawMoney);
        (bool success,) = msg.sender.call{value:_withdrawMoney}(""); // call 함수
        require(success, "failed");
        emit CheckMoney(msg.sender, balance[msg.sender]);
    }
    
    // address(this): 현재 해당 contract 에 있는 모든 주소 가져오기
    function Bankrupcy() external onlyOwner {
        (bool success,) = msg.sender.call{value: address(this).balance}("");
        require(success, "failed");
    }
}