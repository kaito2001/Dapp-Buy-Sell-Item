// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Transactions {
    uint256 transactionCount;
    bool status = false;

    event Transfer(
        address from,
        address receiver,
        uint256 amount,
        string nameCar,
        uint256 timestamp,
        string description
    );

    struct TransferStruct {
        address sender;
        address receiver;
        uint256 amount;
        string nameCar;
        uint256 timestamp;
        string description;
        uint256 blockId;
        string txhash;
    }

    struct ItemCarStruct {
        uint256 id;
        string nameCar;
        string picture;
        address owner;
        uint256 price;
        string description;
    }

    ItemCarStruct[] itemCar;

    function setItemCar() public {
        itemCar.push(
            ItemCarStruct(
                1,
                "Yamaha MT-15",
                "mt15.jpeg",
                0xd03Ac831E0d7183f31D6F8C739fB1B38e6D3027e,
                0.0015 ether,
                "150 cc, 1 xylanh"
            )
        );
        itemCar.push(
            ItemCarStruct(
                2,
                "Honda CBR-150",
                "honda150.jpeg",
                0xd03Ac831E0d7183f31D6F8C739fB1B38e6D3027e,
                0.0018 ether,
                "150 cc, 1 xylanh"
            )
        );
        itemCar.push(
            ItemCarStruct(
                3,
                "Yamaha R-15",
                "r15.jpeg",
                0xd03Ac831E0d7183f31D6F8C739fB1B38e6D3027e,
                0.0017 ether,
                "150 cc, 1 xylanh"
            )
        );
        itemCar.push(
            ItemCarStruct(
                4,
                "Honda CBR-250",
                "honda250.jpeg",
                0xd03Ac831E0d7183f31D6F8C739fB1B38e6D3027e,
                0.0025 ether,
                "150 cc, 1 xylanh"
            )
        );
        itemCar.push(
            ItemCarStruct(
                5,
                "Yamaha XSR-155",
                "xsr155.jpeg",
                0xd03Ac831E0d7183f31D6F8C739fB1B38e6D3027e,
                0.002 ether,
                "150 cc, 1 xylanh"
            )
        );
        status = true;
    }

    function getItemCar() public view returns (ItemCarStruct[] memory) {
        return itemCar;
    }

    function buyACar(uint256 _id) public {
        ItemCarStruct storage car = itemCar[_id - 1];
        require(car.owner != msg.sender, "You're not buy your item!");
        car.owner = msg.sender;
    }

    TransferStruct[] transactions;

    function addToBlockChain(
        address payable receiver,
        uint256 amount,
        string memory nameCar,
        string memory description,
        uint256 blockId,
        string memory txhash
    ) public {
        transactionCount += 1;
        transactions.push(
            TransferStruct(
                msg.sender,
                receiver,
                amount,
                nameCar,
                block.timestamp,
                description,
                blockId,
                txhash
            )
        );

        emit Transfer(
            msg.sender,
            receiver,
            amount,
            nameCar,
            block.timestamp,
            description
        );
    }

    function getAllTransactions()
        public
        view
        returns (TransferStruct[] memory)
    {
        return transactions;
    }
    
    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }

    function getStatus() public view returns (bool) {
        return status;
    }
}
