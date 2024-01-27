contract c16772{
    /// @dev Put a kitty up for auction.
    ///  Does some ownership trickery to create auctions in one tx.
    function createSaleAuction(
        uint256 _petId,
        uint256 _startingPrice,
        uint256 _endingPrice,
        uint256 _duration
    )
        external
        whenNotPaused
    {
        // Auction contract checks input sizes
        // If kitty is already on any auction, this will throw
        // because it will be owned by the auction contract.
        require(_owns(msg.sender, _petId));
        _approve(_petId, saleAuction);
        // Sale auction throws if inputs are invalid and clears
        // transfer and sire approval after escrowing the kitty.
        saleAuction.createAuction(
            _petId,
            _startingPrice,
            _endingPrice,
            _duration,
            msg.sender
        );
    }    
}