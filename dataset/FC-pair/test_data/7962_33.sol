contract c7962{
    /// @dev Checks if a given address currently has transferApproval for a particular 
    /// Animecard.
    /// @param _claimant the address we are confirming Animecard is approved for.
    /// @param _tokenId Animecard id, only valid when > 0
    function _approvedFor(address _claimant, uint256 _tokenId)
    internal
    view
    returns(bool) {
        return animecardToApproved[_tokenId] == _claimant;
    }
}