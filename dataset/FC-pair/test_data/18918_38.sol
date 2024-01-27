contract c18918{
    /// @dev Cancels an auction unconditionally.
    function _cancelAuction(uint _tokenId) internal {
	    Auction storage auction = tokenIdToAuction[_tokenId];
		_transItem(this, auction.seller, _tokenId);
        delete tokenIdToAuction[_tokenId];
        emit AuctionCancelled(_tokenId);
    }
}