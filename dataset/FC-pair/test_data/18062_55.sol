contract c18062{
    /// @dev we can create promo artworks, up to a limit. Only callable by COO
    /// @param _owner the future owner of the created artworks. Default to contract COO
    function createPromoArtwork(string _name, string _author, uint32 _series, address _owner) external onlyCOO {
        bytes32 uniqueKey = getUniqueKey(_name, _author, _series);
        (require(!uniqueArtworks[uniqueKey]));
        if (_series != 0) {
            bytes32 uniqueKeyForZero = getUniqueKey(_name, _author, 0);
            (require(!uniqueArtworks[uniqueKeyForZero]));
        }
        address artworkOwner = _owner;
        if (artworkOwner == address(0)) {
            artworkOwner = cooAddress;
        }
        require(promoCreatedCount < PROMO_CREATION_LIMIT);
        promoCreatedCount++;
        _createArtwork(_name, _author, _series, artworkOwner);
        uniqueArtworks[uniqueKey] = true;
    }
}