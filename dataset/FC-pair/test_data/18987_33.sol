contract c18987{
    /// @notice Check if asset is in the state passed by parameter
    /// @param _tokenId The UniqueId of the asset of interest.
    /// @param _state see enum AssetState in EthernautsBase for possible states
    function isState(uint256 _tokenId, uint8 _state) public view returns (bool) {
        return assets[_tokenId].state == _state;
    }
}