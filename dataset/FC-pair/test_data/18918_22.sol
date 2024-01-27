contract c18918{
    /// @notice Transfer a Rabbit owned by another address, for which the calling address
    ///  has previously been granted transfer approval by the owner.
    /// @param _from The address that owns the Rabbit to be transfered.
    /// @param _to The address that should take ownership of the Rabbit. Can be any address,
    ///  including the caller.
    /// @param _tokenId The ID of the Rabbit to be transferred.
    /// @dev Required for ERC-721 compliance.
    function transferFrom(
        address _from,
        address _to,
        uint _tokenId
    )
        external
        whenNotPaused
    {
        // Safety check to prevent against an unexpected 0x0 default.
        require(_to != address(0));
        //
        require(_owns(_from, _tokenId));
        // Check for approval and valid ownership
        require(_approvedFor(msg.sender, _tokenId));
        // Reassign ownership (also clears pending approvals and emits Transfer event).
        _transItem(_from, _to, _tokenId);
    }
}