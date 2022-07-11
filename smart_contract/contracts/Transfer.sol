// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.6;

contract Transfer {
    
    struct Car {
        uint price;
        address owner;
        string description;
        bool status;
    }
    

    Car[] public cars;
    
    function setCar() public {
        Car memory car = Car(1 ether,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 , "good car", false);
        for(uint i = 0; i < 10; i++ ) {
            cars.push(car);
        }
    }

    function viewAllCars() public view returns (Car[] memory) {
        return cars;
    }

    function buyACar(uint _id ,address payable _recipient) external payable {
        Car storage car = cars[_id - 1];
        require(car.status == false, "This item has been purchased");
        require(car.owner != msg.sender, "You're not buy your item!");
        car.owner = msg.sender;
        car.status = true;
        _recipient.transfer(msg.value);
    }

    function sellACar(uint _id, address payable _recipient) external payable {
        Car storage car = cars[_id - 1];
        require(car.status == true, "This item don't sell by you");
        car.owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        car.status = false;
        _recipient.transfer(msg.value * 110 / 100);
    }
    
}