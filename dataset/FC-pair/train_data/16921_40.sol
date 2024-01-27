contract c16921{
    /// @dev Import cuties from previous version of Core contract (part 2).
    /// @param _oldAddress Old core contract address
    /// @param _fromIndex (inclusive)
    /// @param _toIndex (inclusive)
    function migrate2(address _oldAddress, uint40 _fromIndex, uint40 _toIndex, address saleAddress, address breedingAddress) public onlyOwner whenPaused
    {
        BlockchainCutiesCore old = BlockchainCutiesCore(_oldAddress);
        MarketInterface oldSaleMarket = MarketInterface(saleAddress);
        MarketInterface oldBreedingMarket = MarketInterface(breedingAddress);
        for (uint40 i = _fromIndex; i <= _toIndex; i++)
        {
            address owner = old.ownerOf(i);
            if (owner == saleAddress)
            {
                (owner,,,,,) = oldSaleMarket.getAuctionInfo(i);
            }
            if (owner == breedingAddress)
            {
                (owner,,,,,) = oldBreedingMarket.getAuctionInfo(i);
            }
            _transfer(0, owner, i);
        }
    }
}