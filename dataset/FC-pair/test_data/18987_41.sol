contract c18987{
    /// @dev Checks if a given address currently has transferApproval for a particular Asset.
    /// @param _claimant the address we are confirming asset is approved for.
    /// @param _tokenId asset UniqueId, only valid when > 0
    function _approvedFor(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return ethernautsStorage.approvedFor(_tokenId) == _claimant;
    }
}