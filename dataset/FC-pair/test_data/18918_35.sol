contract c18918{
    /// @dev Cancels an auction that hasn't been won yet.
    ///  Returns the NFT to original owner.
    /// @notice This is a state-modifying function that can
    ///  be called while the contract is paused.
    /// @param _tokenId - ID of token on auction
    function cancelAuction(uint _tokenId) external whenNotPaused {
        Auction storage auction = tokenIdToAuction[_tokenId];
        require(auction.startedAt > 0);
        address seller = auction.seller;
        require(msg.sender == seller);
        _cancelAuction(_tokenId);
    }
}