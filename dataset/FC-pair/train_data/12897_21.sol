contract c12897{
    /// @dev Updates buy price (owner ONLY)
    /// @param newBuyPrice New buy price (in UNIT) 1ETH <=> 80,000 SPKIE = 100,000.0000000000 unit
    function setBuyPrice(uint256 newBuyPrice) 
    onlyOwner 
    public {
        require(newBuyPrice>0);
        _originalBuyPrice = newBuyPrice; // unit
        // control _maximumBuy_USD = 10,000 USD, SPIKE price is 0.01USD
        // maximumBuy_SPIKE = 1000,000 SPIKE = 1000,000,0000000000 unit = 10^16
        _maximumBuy = (10**18 * 10**16) /_originalBuyPrice;
    }
}