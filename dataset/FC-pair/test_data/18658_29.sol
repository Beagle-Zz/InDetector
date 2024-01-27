contract c18658{
    // /// End the auction and send the highest bid
    // /// to the beneficiary.
    function endAuction(uint256 _tokenId) external {
        // It is a good guideline to structure functions that interact
        // with other contracts (i.e. they call functions or send Ether)
        // into three phases:
        // 1. checking conditions
        // 2. performing actions (potentially changing conditions)
        // 3. interacting with other contracts
        // If these phases are mixed up, the other contract could call
        // back into the current contract and modify the state or cause
        // effects (ether payout) to be performed multiple times.
        // If functions called internally include interaction with external
        // contracts, they also have to be considered interaction with
        // external contracts.
        Auction storage auction = tokenIdToAuction[_tokenId];
        // 1. Conditions
        require(auction.endTime < block.timestamp);
        require(auction.live); // this function has already been called
        // 2. Effects
        auction.live = false;
        AuctionEnded(_tokenId, auction.highestBidder, auction.highestBid);
        // 3. Interaction
        address owner = pixelIndexToOwner[_tokenId];
        // transfer money without 
        uint amount = auction.highestBid * 9 / 10;
        pendingReturns[owner] += amount;
        authorityBalance += (auction.highestBid - amount);
        // transfer token
        _transfer(owner, auction.highestBidder, _tokenId);
    }
}