contract c18051{
    /// @dev Put a artwork up for auction.
    ///  Does some ownership trickery to create auctions in one tx.
    function createSaleAuction(
        uint256 _artworkId,
        uint256 _startingPrice,
        uint256 _endingPrice,
        uint256 _duration
    )
        external
        whenNotPaused
    {
        // Auction contract checks input sizes
        // If artwork is already on any auction, this will throw
        // because it will be owned by the auction contract.
        require(_owns(msg.sender, _artworkId));
        _approve(_artworkId, saleAuction);
        // Sale auction throws if inputs are invalid and clears
        // transfer and sire approval after escrowing the artwork.
        saleAuction.createAuction(
            _artworkId,
            _startingPrice,
            _endingPrice,
            _duration,
            msg.sender
        );
    }
}