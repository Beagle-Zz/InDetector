contract c18918{
    /// @dev Checks if a given address currently has transferApproval for a particular Rabbit.
    /// @param _claimant the address we are confirming rabbit is approved for.
    /// @param _tokenId rabbit id, only valid when > 0
    function _approvedFor(address _claimant, uint _tokenId) internal view returns (bool) {
        return rabbitToApproved[_tokenId] == _claimant;
    }
}