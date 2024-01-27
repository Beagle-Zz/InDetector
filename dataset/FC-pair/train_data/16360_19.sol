contract c16360{
    /// @dev Update only stats
    /// @param _tokenId asset UniqueId
    /// @param _stats asset state, see Asset Struct description
    function updateStats(uint256 _tokenId, uint8[STATS_SIZE] _stats) public validAsset(_tokenId) onlyGrantedContracts {
        assets[_tokenId].stats = _stats;
    }
}