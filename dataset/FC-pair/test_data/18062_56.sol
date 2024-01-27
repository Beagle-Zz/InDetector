contract c18062{
    /// @dev Creates a new artwork with the given name and author and
    ///  creates an auction for it.
    function createArtworkAuction(string _name, string _author, uint32 _series) external onlyCOO {
        bytes32 uniqueKey = getUniqueKey(_name, _author, _series);
        (require(!uniqueArtworks[uniqueKey]));
        require(artsCreatedCount < CREATION_LIMIT);
        if (_series != 0) {
            bytes32 uniqueKeyForZero = getUniqueKey(_name, _author, 0);
            (require(!uniqueArtworks[uniqueKeyForZero]));
        }
        uint256 artworkId = _createArtwork(_name, _author, _series, address(this));
        _approve(artworkId, saleAuction);
        uint256 price = _computeNextArtworkPrice();
        saleAuction.createAuction(
            artworkId,
            price,
            0,
            ARTWORK_AUCTION_DURATION,
            address(this)
        );
        artsCreatedCount++;
        uniqueArtworks[uniqueKey] = true;
    }
}