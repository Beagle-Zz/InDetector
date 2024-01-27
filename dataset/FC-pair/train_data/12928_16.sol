contract c12928{
    /// @dev Checks if a given address currently has transferApproval for a particular Dog.
    /// @param _claimant the address we are confirming kitten is approved for.
    /// @param _tokenId kitten id, only valid when > 0
    function _approvedFor(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return dogIndexToApproved[_tokenId] == _claimant;
    }
}