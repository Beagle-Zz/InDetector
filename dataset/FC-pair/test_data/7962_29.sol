contract c7962{
    /// @dev Transfer a Animecard owned by another address, for which the calling address
    ///  has previously been granted transfer approval by the owner.
    /// @param _from The address that owns the Animecard to be transfered.
    /// @param _to The address that should take ownership of the Animecard. Can be any
    /// address, including the caller.
    /// @param _tokenId The ID of the Animecard to be transferred.
    /// @notice Required for ERC-20 and ERC-721 compliance.
    function transferFrom(address _from, address _to, uint256 _tokenId)
    external
    whenNotPaused {
        // Safety check to prevent against an unexpected 0x0 default.
        require(_to != address(0));
        // Disallow transfers to this contract to prevent accidental misuse.
        // The contract should never own any animecard (except very briefly
        // after an animecard is created).
        require(_to != address(this));
        // Check for approval and valid ownership
        require(_approvedFor(msg.sender, _tokenId));
        require(_owns(_from, _tokenId));
        // Reassign ownership (also clears pending approvals and fires Transfer event).
        _transfer(_from, _to, _tokenId);
    }
}