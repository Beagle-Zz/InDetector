contract c13772{
    /// @dev Checks if a given address currently has transferApproval for a particular EtherDog.
    /// @param _claimant the address we are confirming EtherDog is approved for.
    /// @param _tokenId EtherDog id, only valid when > 0
    function _approvedFor(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return EtherDogIndexToApproved[_tokenId] == _claimant;
    }
}