contract c18051{
    /// @dev Checks if a given address currently has transferApproval for a particular Artwork.
    /// @param _claimant the address we are confirming artwork is approved for.
    /// @param _tokenId artwork id, only valid when > 0
    function _approvedFor(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return artworkIndexToApproved[_tokenId] == _claimant;
    }
}