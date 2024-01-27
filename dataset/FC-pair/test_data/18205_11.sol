contract c18205{
    /// @notice Allow users to buy tokens for 'newBuyPrice', in wei
    /// @param newBuyPrice Price users can buy from the contract, in wei
    function setPrices(uint256 newBuyPrice) onlyOwner public {
        buyPrice = newBuyPrice;
    }
}