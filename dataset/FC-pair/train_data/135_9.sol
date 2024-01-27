contract c135{
    /**
        @dev Allows the owner to change market fees
        @param fees The new fees to apply (can be zero)
    */
    function setMarketFees(uint256 fees) external
    onlyOwner()
    {
        marketMakerFee = fees;
    }
}