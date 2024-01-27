contract c18987{
    /// @dev Update only asset state
    /// @param _tokenId asset UniqueId
    /// @param _state asset state, see Asset Struct description
    function updateState(uint256 _tokenId, uint8 _state) public validAsset(_tokenId) onlyGrantedContracts {
        assets[_tokenId].state = _state;
    }
}