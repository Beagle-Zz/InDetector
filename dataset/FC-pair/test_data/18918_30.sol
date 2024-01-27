contract c18918{
    /// @notice customer buy a box
    function buyBox1() external payable whenNotPaused returns (bool) {
		require(isNotContract(msg.sender));
        require(box1OnSale);
        require(msg.value >= priceBox1);
        uint tempVal = uint(keccak256(uint(msg.sender) + secretKey + rabbits.length));
        tempVal = tempVal % 10000;
        uint _star = 3; //default
        if (tempVal <= box1Star5){
            _star = 5;
			require(CREATED_STAR5 < LIMIT_STAR5);
        } else if (tempVal <= box1Star5 + box1Star4){
            _star = 4;
			require(CREATED_STAR4 < LIMIT_STAR4);
        } 
        _createRabbitInGrade(_star, msg.sender, 2);
        // Return the funds. 
        uint fundsExcess = msg.value - priceBox1;
        if (fundsExcess > 1 finney) {
            msg.sender.transfer(fundsExcess);
        }
        return true;
    }
}