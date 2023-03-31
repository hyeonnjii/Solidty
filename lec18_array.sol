// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;
 
 // array : length 구할 수 있음 (50으로 제한 시키는 것이 좋음), key는 자동으로 0부터 실행됨
 // but, 이더리움은 mapping을 좀 더 선호
 // mapping, array는 값을 받아도, 변경된 값을 update해줘야 해 
contract lec18{
    
    
    uint256[] public ageArray; // 배열 생성 > 사이즈 제한없어서 무한대로 넣을 수 있음
    uint256[10] public ageFixedSizeArray; // 배열의 length 값 설정 > 0-9 인덱스까지만 지정가능
    string[] public nameArray= ["Kal","Jhon","Kerri"]; // 배열의 값을 미리 지정할 수 있음
  
    // array 길이 구하기 .length
    function AgeLength()public view returns(uint256) {
        return ageArray.length; // array 배열의 length 구할 수 있음(.length)
    }
    
    // array 에 값을 넣는 함수
    function AgePush(uint256 _age)public{
        ageArray.push(_age);
    }

    // ageArray에 없는 index 값을 넣을 경우, error가 남
    function AgeChange(uint256 _index, uint256 _age)public{
        ageArray[_index] = _age;
    }
    // 특정 index를 넣었을 때, 해당 index에 해당하는 value 가 나오게 하는 함수
    function AgeGet(uint256 _index)public view returns(uint256){
        return ageArray[_index];
    }

    // 가장 늦게 들어간게 나오면서 삭제됨(length 1줄어듦)
    function AgePop()public {
        ageArray.pop();
    }

    // delete 사용시 length 값은 그대로, 해당 key에 해당하는 value 가 0이 됨
    // 0 -> 50 인데 0을 인덱스로 넣었다면 0 -> 0이 됨
    function AgeDeleter(uint256 _index)public{
        delete ageArray[_index];
    }
    
    function AgePop(uint256 _index)public {
        delete ageArray[_index];
    }
    
    function examples() external {
     // create array in memory, only fixed size can be created
     uint[] memory a = new uint[](5); > 5 라는 fixed size 가 지정되어야 함! > memory 니까!!


}
