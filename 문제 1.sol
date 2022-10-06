// SPDX-License-Identifier: GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract A{
    
    uint256 public cash;
    uint256 public ethcoin;

    function WeitoEther(uint256 _wei) public returns(uint256){
        ethcoin = _wei / 1000000000000000000;
        return ethcoin;
    }

    function EthertoCash(uint256 _eth) public returns(uint256){
        cash = _eth * 1915650;
        return cash;
    }

    function get_info_ether(uint256 _wei) public returns(uint256){
        return WeitoEther(_wei);
    }
    
    function get_info_cash(uint256 _eth) public returns(uint256){
        return EthertoCash(_eth);
    }
}

contract B{

    event info(uint256 ethcoin, uint256 cash, uint256 weicoin);

    A instance = new A();
    
    uint256 public weicoin;
    uint256 public ethcoin;

    constructor(uint256 _wei, uint256 _eth){
        weicoin = _wei;
        ethcoin = _eth;
    }
    
    function getinfo() public {
        emit info(instance.get_info_ether(weicoin),instance.get_info_cash(ethcoin), weicoin); 
    }
    
}