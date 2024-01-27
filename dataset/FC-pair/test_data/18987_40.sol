contract c18987{
    /// @dev Checks if a given address is the current owner of a particular Asset.
    /// @param _claimant the address we are validating against.
    /// @param _tokenId asset UniqueId, only valid when > 0
    function _owns(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return ethernautsStorage.ownerOf(_tokenId) == _claimant;
    }
}