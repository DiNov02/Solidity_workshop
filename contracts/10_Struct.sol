// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Structs{
enum CarType {SEDAN, OFFROAD}
        struct Car{
            
            string brand;
            uint year;
            bool crashed;
            CarType carType;
        }

        Car public car;
        mapping (address => Car[]) public carMap;

        function createCar(string memory _brand, uint _year, bool _crashed, CarType _carType) public {
            car = Car(_brand, _year, _crashed, _carType);
        }

        function addCarToMap(string memory _brand, uint _year, bool _crashed, CarType _carType) public {
            carMap[msg.sender].push(Car(_brand, _year, _crashed, _carType));
            // carMap[msg.sender] = Car(_brand, _year, _crashed);
        }
}