contract c10694{
    /**
    * Set finalPriceForThisCoin
    */
    function setExchangePrice(int256 price) public onlyOwner {
        require(price > 0);
        exchangePrice = uint256(price);
    }
}