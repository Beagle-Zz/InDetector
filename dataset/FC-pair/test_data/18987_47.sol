contract c18987{
    /// @dev Required for ERC-721 compliance.
    /// @notice Transfer a Asset owned by another address, for which the calling address
    ///  has previously been granted transfer approval by the owner.
    /// @param _from The address that owns the Asset to be transfered.
    /// @param _to The address that should take ownership of the Asset. Can be any address,
    ///  including the caller.
    /// @param _tokenId The ID of the Asset to be transferred.
    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    )
    external
    whenNotPaused
    {
        _transferFrom(_from, _to, _tokenId);
    }
}