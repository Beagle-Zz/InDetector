contract c16921{
    /// @dev Sets the reference to the breeding auction.
    /// @param _breedingAddress - Address of breeding market contract.
    /// @param _saleAddress - Address of sale market contract.
    function setMarketAddress(address _breedingAddress, address _saleAddress) public onlyOwner
    {
        //require(address(breedingMarket) == address(0));
        //require(address(saleMarket) == address(0));
        breedingMarket = MarketInterface(_breedingAddress);
        saleMarket = MarketInterface(_saleAddress);
    }
}