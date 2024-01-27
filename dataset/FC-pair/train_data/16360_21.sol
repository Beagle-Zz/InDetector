contract c16360{
    /// @dev Update Cooldown for a single asset
    /// @param _tokenId asset UniqueId
    /// @param _cooldown asset state, see Asset Struct description
    function setAssetCooldown(uint256 _tokenId, uint256 _cooldown, uint64 _cooldownEndBlock)
    public validAsset(_tokenId) onlyGrantedContracts {
        assets[_tokenId].cooldown = _cooldown;
        assets[_tokenId].cooldownEndBlock = _cooldownEndBlock;
    }
}