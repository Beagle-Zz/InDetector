contract c7497{
    /// @dev returns the USDETH price, ie gets the USD price from Maker feed with 18 digits, but last 18 digits are cut off
    function getUSDETHPrice() 
        public
        returns (uint256)
    {
        // if the contract is in the emergencyMode, because there is an issue with the oracle, we will simply return a price of 600 USD
        if(emergencyMode){
            return 600;
        }
        bytes32 price;
        bool valid=true;
        (price, valid) = Medianizer(priceFeedSource).peek();
        if (!valid) {
            NonValidPriceFeed(priceFeedSource);
        }
        // ensuring that there is no underflow or overflow possible,
        // even if the price is compromised
        uint priceUint = uint256(price)/(1 ether);
        if (priceUint == 0) return 1;
        if (priceUint > 1000000) return 1000000; 
        return priceUint;
    }  
}