contract c11658{
    /// @dev Checks if a given address is the current owner of a particular narco.
    /// @param _claimant the address we are validating against.
    /// @param _tokenId narco id, only valid when > 0
    function _owns(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return narcoIndexToOwner[_tokenId] == _claimant;
    }
}