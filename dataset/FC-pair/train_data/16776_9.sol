contract c16776{
    /// @dev Returns true if the claimant owns the token.
    /// @param _claimant - Address claiming to own the token.
    /// @param _cutieId - ID of token whose ownership to verify.
    function _isOwner(address _claimant, uint40 _cutieId) internal view returns (bool) {
        return (coreContract.ownerOf(_cutieId) == _claimant);
    }
}