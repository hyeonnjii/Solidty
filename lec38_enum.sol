// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
/enum: 사람이 읽을수 있게, 사용자/개발자에 의해 정의된 상수세트 타입 (uint8 = 0~255(2^8-1))
    enum 이름 {
    }
*/


// 상수를 구분하게 되어, 가독성 높이며 같은 이름이 가지게 되는 경우 방지 가능

contract lec38{
    
    enum CarStatus{ 
        TurnOff,
        TurnOn,
        Driving,
        Stop
    }
    
    CarStatus public carStatus;
    
    constructor(){
            carStatus = CarStatus.TurnOff;
    }
    
    event carCurrentStatus(CarStatus _carStatus, uint256 _carStatusInInt);
    
    function turnOnCar() public {
        require(carStatus == CarStatus(0), "To turn on, your car must be turned off");
        carStatus = CarStatus(1);
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }
    

    function DrivingCar() public {
        require(carStatus == CarStatus.TurnOn, "To drive a car, your car must be turned on");
            carStatus = CarStatus.Driving;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }
    
    function StopCar() public {
        require(carStatus == CarStatus.Driving, "To drive a car, your car must be turned on");
        carStatus = CarStatus.Stop;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }
    
    function turnOffCar() public {
        require(carStatus == CarStatus.TurnOn 
                || carStatus == CarStatus.Stop , "To turn off, your car must be turned on or driving");
        carStatus = CarStatus.TurnOff;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }

    function CheckStatus() public view returns(CarStatus) {
        return carStatus;
    }
}
