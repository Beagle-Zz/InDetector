contract c13608{
    /// @dev Places a bid for siring. Requires the sender
    /// is the EtherDogCore contract because all bid methods
    /// should be wrapped. Also returns the EtherDog to the
    /// seller rather than the winner.
    function bid(uint256 _tokenId)
        external
        payable
    {
        require(msg.sender == address(nonFungibleContract));
        address seller = tokenIdToAuction[_tokenId].seller;
        // _bid checks that token ID is valid and will throw if bid fails
        _bid(_tokenId, msg.value);
        // We transfer the EtherDog back to the seller, the winner will get
        // the offspring
        _transfer(seller, _tokenId);
    }
}