contract c16772{
    // Internal utility functions: These functions all assume that their input arguments
    // are valid. We leave it to public methods to sanitize their inputs and follow
    // the required logic.
    /// @dev Checks if a given address is the current owner of a particular Kitty.
    /// @param _claimant the address we are validating against.
    /// @param _tokenId kitten id, only valid when > 0
    function _owns(address _claimant, uint256 _tokenId) internal view returns (bool) {
        return petIndexToOwner[_tokenId] == _claimant;
    }
}