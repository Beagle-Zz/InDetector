contract c18051{
    /// @notice Grant another address the right to transfer a specific Artwork via
    ///  transferFrom(). This is the preferred flow for transfering NFTs to contracts.
    /// @param _to The address to be granted transfer approval. Pass address(0) to
    ///  clear all approvals.
    /// @param _tokenId The ID of the Artwork that can be transferred if this call succeeds.
    /// @dev Required for ERC-721 compliance.
    function approve(
        address _to,
        uint256 _tokenId
    )
        external
        whenNotPaused
    {
        // Only an owner can grant transfer approval.
        require(_owns(msg.sender, _tokenId));
        // Register the approval (replacing any previous approval).
        _approve(_tokenId, _to);
        // Emit approval event.
        Approval(msg.sender, _to, _tokenId);
    }
}