contract c4833{
    /// @notice Allow users to buy tokens for `newBuyPrice` eth
    /// @param newBuyPrice Price users can buy from the contract
    function setPrices(uint256 newBuyPrice) onlyOwner public {
        buyPrice = newBuyPrice;
    }
}