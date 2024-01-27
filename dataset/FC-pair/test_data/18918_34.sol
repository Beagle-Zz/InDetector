contract c18918{
    /// @dev Bids on an open auction, completing the auction and transferring
    ///  ownership of the NFT if enough Ether is supplied.
    /// @param _tokenId - ID of token to bid on.
    function bid(uint _tokenId) external payable whenNotPaused {
		require(isNotContract(msg.sender));
        // Get a reference to the auction struct
        Auction storage auction = tokenIdToAuction[_tokenId];
        require(auction.startedAt > 0);
        // Check that the bid is greater than or equal to the current price
        uint price = _calcCurrentPrice(auction);
        require(msg.value >= price);
        // Grab a reference to the seller before the auction struct gets deleted.
        address seller = auction.seller;
		//
		require(_owns(this, _tokenId));
        // The bid is good! Remove the auction before sending the fees
        // to the sender so we can't have a reentrancy endurance.
        delete tokenIdToAuction[_tokenId];
        if (price > 0) {
            // Calculate the auctioneer's cut.
            uint auctioneerCut = price * masterCut / 10000;
            uint sellerProceeds = price - auctioneerCut;
			require(sellerProceeds <= price);
            // Doing a transfer() after removing the auction
            seller.transfer(sellerProceeds);
        }
        // Calculate any excess funds included with the bid. 
        uint bidExcess = msg.value - price;
        // Return the funds. 
		if (bidExcess >= 1 finney) {
			msg.sender.transfer(bidExcess);
		}
        // Tell the world!
        emit AuctionSuccessful(_tokenId, price, msg.sender);
        //give goods to bidder.
        _transItem(this, msg.sender, _tokenId);
    }
}