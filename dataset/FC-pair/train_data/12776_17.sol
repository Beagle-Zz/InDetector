contract c12776{
    // Get current price of a Token
    // @return the price or token value for a ether
    function getPrice() public view returns (uint256 result) {
        if ((now > preSaleStartTime) && (now < preSaleStartTime + 60 days) && (presaleTotalNumberTokenSold < _saleSupply)) {
			if ((now > preSaleStartTime) && (now < preSaleStartTime + 14 days)) {
                return 15000;
            } else if ((now >= preSaleStartTime + 14 days) && (now < preSaleStartTime + 28 days)) {
                return 13000;
            } else if ((now >= preSaleStartTime + 28 days) && (now < preSaleStartTime + 42 days)) {
                return 11000;
            } else if ((now >= preSaleStartTime + 42 days)) {
                return 10500;
            }
        } else if ((now > mainSaleStartTime) && (now < mainSaleStartTime + 30 days) && (mainsaleTotalNumberTokenSold < _mainsaleSupply)) {
            if ((now > mainSaleStartTime) && (now < mainSaleStartTime + 30 days)) {
                return 10000;
            }
        } else {
            return 0;
        }
    }
}