// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;


contract AccessControl {
    
    address first_owner;
    uint256 ownersCount = 0; // 현재 오너 수
    

    mapping(address => bool) owners;
    mapping(address => uint256) ownerCandidates; // OWNER 후보자 
    // mapping(address => bool) voting; // 투표자의 투표표
    mapping(address => mapping(address => bool)) isVoted; // 한번만 투표 가능 
    // 후보자 address
    mapping(address => bool) users;

    modifier onlyOwner {
        require(owners[msg.sender], "Only Owner");
        _; // modifier에선 항상 붙여주기
    }

    modifier onlyUser {
        require(users[msg.sender]|| owners[msg.sender], "Only User");
        _;
    }

    // 처음 생성시에만 실행됨! > 스마트 컨트랙 실행자만 owner 권한 갖게 하는 경우 많이 사용
    constructor() payable {
        first_owner = msg.sender;
        owners[first_owner] = true;
        ownersCount++;
    }


    function AddOwnerCandidate(address _address) external onlyOwner {
        ownerCandidates[_address] = 1;
        if (ownersCount == 1) {
            owners[_address] = true;
        }
    }   
    
    function voteToCandidates(address can_address, bool _vote) external onlyOwner {
        require(isVoted[can_address][msg.sender] == false, "Already Voted");
        isVoted[can_address][msg.sender] = _vote;
        ownerCandidates[can_address]++;
        
        uint256 standard = 2  * ownersCount / 3;  // float type 없음 > 나눠도 몪만 나옴
        if (ownerCandidates[can_address] >= standard) {
            owners[can_address] = true;
        }
    }

    function AddUser(address _address) external onlyUser {
        users[_address] = true;
    }
}
