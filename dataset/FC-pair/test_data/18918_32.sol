contract c18918{
    /// @dev Creates and begins a new auction.
    /// @param _tokenId - ID of token to auction, sender must be owner.
    /// @param _startingPrice - Price of item (in wei) at beginning of auction.
    /// @param _endingPrice - Price of item (in wei) at end of auction.
    /// @param _duration - Length of time to move between starting
    ///  price and ending price (in seconds).
    function createAuction(
        uint _tokenId,
        uint _startingPrice,
        uint _endingPrice,
        uint _duration
    )
        external whenNotPaused
    {
		require(isNotContract(msg.sender));
        require(_endingPrice >= 1 finney);
        require(_startingPrice >= _endingPrice);
        require(_duration <= 100 days); 
        require(_owns(msg.sender, _tokenId));
		//assigning the ownship to this contract,
        _transItem(msg.sender, this, _tokenId);
        Auction memory auction = Auction(
            msg.sender,
            uint128(_startingPrice),
            uint128(_endingPrice),
            uint64(_duration),
            uint64(now)
        );
        _addAuction(_tokenId, auction);
    }
}