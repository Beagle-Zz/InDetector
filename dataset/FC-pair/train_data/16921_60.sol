contract c16921{
    /// @dev The balance transfer from the market and plugins contract
    /// to the CutieCore contract.
    function withdrawBalances() external
    {
        require(
            msg.sender == ownerAddress || 
            msg.sender == operatorAddress);
        saleMarket.withdrawEthFromBalance();
        breedingMarket.withdrawEthFromBalance();
        for (uint32 i = 0; i < pluginsArray.length; ++i)        
        {
            pluginsArray[i].withdraw();
        }
    }
}