// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

library Mapping {
    
    function Add(mapping(address => uint256) storage _map, address _account, uint256 _money) external {
        _map[_account] += _money;
    }

    function Sub(mapping(address => uint256) storage _map, address _account, uint256 _money) external {
        require(_map[_account] - _money > 0, "negative balance");
        _map[_account] -= _money;
    }
}

contract Bank {
    
    using Mapping for mapping(address => uint256);

    address owner;

    event CheckMoney(address owner,uint256 balance);

    constructor() payable{
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only Owner");
        _;
    }
    mapping(address => uint256) public balance;
    
    function sendMoney() external payable {
        balance.Add(msg.owner, msg.value);
        emit CheckMoney(msg.owner, balance[msg.owner]);
    }

    function drawMoney(uint256 _withdrawMoney) external payable{
        balance.Sub(owner, _withdrawMoney);
        (bool success,) = msg.owner.call{value:_withdrawMoney}("");
        require(success, "failed");
        emit CheckMoney(msg.owner, balance[owner]);
    }
    
   
    function Bankrupcy() external onlyOwner {
        (bool success,) = owner.call{value: address(this).balance}("");
        require(success, "failed");
    }
}