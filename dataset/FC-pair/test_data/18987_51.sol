contract c18987{
    /// @dev Creates a new Asset with the given fields. ONly available for C Levels
    /// @param _creatorTokenID The asset who is father of this asset
    /// @param _price asset price
    /// @param _assetID asset ID
    /// @param _category see Asset Struct description
    /// @param _attributes see Asset Struct description
    /// @param _stats see Asset Struct description
    function createNewAsset(
        uint256 _creatorTokenID,
        address _owner,
        uint256 _price,
        uint16 _assetID,
        uint8 _category,
        uint8 _attributes,
        uint8[STATS_SIZE] _stats
    )
    external onlyCLevel
    returns (uint256)
    {
        // owner must be sender
        require(_owner != address(0));
        uint256 tokenID = ethernautsStorage.createAsset(
            _creatorTokenID,
            _owner,
            _price,
            _assetID,
            _category,
            uint8(AssetState.Available),
            _attributes,
            _stats,
            0,
            0
        );
        // emit the build event
        Build(
            _owner,
            tokenID,
            _assetID,
            _price
        );
        return tokenID;
    }
}