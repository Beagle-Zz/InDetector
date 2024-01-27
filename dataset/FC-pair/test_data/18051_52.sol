contract c18051{
    // @notice The auction contract variables are defined in ArtworkBase to allow
    //  us to refer to _createArtworkthem in ArtworkOwnership to prevent accidental transfers.
    // `saleAuction` refers to the auction for created artworks and p2p sale of artworks.
    /// @dev Sets the reference to the sale auction.
    /// @param _address - Address of sale contract.
    function setSaleAuctionAddress(address _address) external onlyCEO {
        SaleClockAuction candidateContract = SaleClockAuction(_address);
        // NOTE: verify that a contract is what we expect -
        //https://github.com/Lunyr/crowdsale-contracts/blob/cfadd15986c30521d8ba7d5b6f57b4fefcc7ac38/contracts/LunyrToken.sol#L117
        require(candidateContract.isSaleClockAuction());
        // Set the new contract address
        saleAuction = candidateContract;
    }
}