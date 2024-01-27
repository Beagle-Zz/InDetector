contract c18987{
    /// @notice Transfer a Asset owned by another address, for which the calling address
    ///  has previously been granted transfer approval by the owner.
    /// @param _from The address that owns the Asset to be transferred.
    /// @param _to The address that should take ownership of the Asset. Can be any address,
    ///  including the caller.
    /// @param _tokenId The ID of the Asset to be transferred.
    function _transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    )
    internal
    {
        // Safety check to prevent against an unexpected 0x0 default.
        require(_to != address(0));
        // Disallow transfers to this contract to prevent accidental misuse.
        // The contract should never own any assets (except for used assets).
        require(_owns(_from, _tokenId));
        // Check for approval and valid ownership
        require(_approvedFor(_to, _tokenId));
        // Reassign ownership (also clears pending approvals and emits Transfer event).
        ethernautsStorage.transfer(_from, _to, _tokenId);
    }
}