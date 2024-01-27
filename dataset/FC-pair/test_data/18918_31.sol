contract c18918{
    /// @notice customer buy a box
    function buyBox2() external payable whenNotPaused returns (bool) {
		require(isNotContract(msg.sender));
        require(box2OnSale);
        require(msg.value >= priceBox2);
        uint tempVal = uint(keccak256(uint(msg.sender) + secretKey + rabbits.length));
        tempVal = tempVal % 10000;
        uint _star = 4; //default
        if (tempVal <= box2Star5){
            _star = 5;
			require(CREATED_STAR5 < LIMIT_STAR5);
        } else {
			require(CREATED_STAR4 < LIMIT_STAR4);
		}
        _createRabbitInGrade(_star, msg.sender, 3);
        // Return the funds. 
        uint fundsExcess = msg.value - priceBox2;
        if (fundsExcess > 1 finney) {
            msg.sender.transfer(fundsExcess);
        }
        return true;
    }
}