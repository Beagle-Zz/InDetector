contract c16360{
    /// @dev A public method that creates a new asset and stores it. This
    ///  method does basic checking and should only be called from other contract when the
    ///  input data is known to be valid. Will NOT generate any event it is delegate to business logic contracts.
    /// @param _creatorTokenID The asset who is father of this asset
    /// @param _owner First owner of this asset
    /// @param _price asset price
    /// @param _ID asset ID
    /// @param _category see Asset Struct description
    /// @param _state see Asset Struct description
    /// @param _attributes see Asset Struct description
    /// @param _stats see Asset Struct description
    function createAsset(
        uint256 _creatorTokenID,
        address _owner,
        uint256 _price,
        uint16 _ID,
        uint8 _category,
        uint8 _state,
        uint8 _attributes,
        uint8[STATS_SIZE] _stats,
        uint256 _cooldown,
        uint64 _cooldownEndBlock
    )
    public onlyGrantedContracts
    returns (uint256)
    {
        // Ensure our data structures are always valid.
        require(_ID > 0);
        require(_category > 0);
        require(_attributes != 0x0);
        require(_stats.length > 0);
        Asset memory asset = Asset({
            ID: _ID,
            category: _category,
            builtBy: _creatorTokenID,
            attributes: bytes2(_attributes),
            stats: _stats,
            state: _state,
            createdAt: uint64(now),
            cooldownEndBlock: _cooldownEndBlock,
            cooldown: _cooldown
            });
        uint256 newAssetUniqueId = assets.push(asset) - 1;
        // Check it reached 4 billion assets but let's just be 100% sure.
        require(newAssetUniqueId == uint256(uint32(newAssetUniqueId)));
        // store price
        assetIndexToPrice[newAssetUniqueId] = _price;
        // This will assign ownership
        transfer(address(0), _owner, newAssetUniqueId);
        return newAssetUniqueId;
    }
}