contract c7962{
    /// @dev Checks if a given address is the current owner of a particular Animecard.
    /// @param _claimant the address we are validating against.
    /// @param _tokenId Animecard id, only valid when > 0
    function _owns(address _claimant, uint256 _tokenId)
    internal
    view
    returns(bool) {
        return animecardToOwner[_tokenId] == _claimant;
    }
}