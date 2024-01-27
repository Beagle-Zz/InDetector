contract c16360{
    /// @dev A public method that edit asset in case of any mistake is done during process of creation by the developer. This
    /// This method doesn't do any checking and should only be called when the
    ///  input data is known to be valid.
    /// @param _tokenId The token ID
    /// @param _creatorTokenID The asset that create that token
    /// @param _price asset price
    /// @param _ID asset ID
    /// @param _category see Asset Struct description
    /// @param _state see Asset Struct description
    /// @param _attributes see Asset Struct description
    /// @param _stats see Asset Struct description
    /// @param _cooldown asset cooldown index
    function editAsset(
        uint256 _tokenId,
        uint256 _creatorTokenID,
        uint256 _price,
        uint16 _ID,
        uint8 _category,
        uint8 _state,
        uint8 _attributes,
        uint8[STATS_SIZE] _stats,
        uint16 _cooldown
    )
    external validAsset(_tokenId) onlyCLevel
    returns (uint256)
    {
        // Ensure our data structures are always valid.
        require(_ID > 0);
        require(_category > 0);
        require(_attributes != 0x0);
        require(_stats.length > 0);
        // store price
        assetIndexToPrice[_tokenId] = _price;
        Asset storage asset = assets[_tokenId];
        asset.ID = _ID;
        asset.category = _category;
        asset.builtBy = _creatorTokenID;
        asset.attributes = bytes2(_attributes);
        asset.stats = _stats;
        asset.state = _state;
        asset.cooldown = _cooldown;
    }
}