contract c2276{
    // @dev Extend item listing: new expiry = current expiry + defaultExpiry
    // @param _contract whitelisted contract
    // @param _tokenId  tokenId
    function extendItem(address _contract, uint _tokenId) public onlyWhitelisted(_contract) returns(bool) {
        bytes32 key = _getHashKey(_contract, _tokenId);
        address seller = listings[key].seller;
        require(seller == msg.sender, "Only seller can extend listing.");
        require(listings[key].expiry > 0, "Item not listed.");
        listings[key].expiry = now + defaultExpiry;
        emit LogListingExtended(seller, _contract, _tokenId, listings[key].createdAt, listings[key].expiry);
        return true;
    }
}