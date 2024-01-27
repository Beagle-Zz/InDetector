contract c7962{
    /// @dev Grant another address the right to transfer a specific Anime card via
    ///  transferFrom(). This is the preferred flow for transfering NFTs to contracts.
    /// @param _to The address to be granted transfer approval. Pass address(0) to
    ///  clear all approvals.
    /// @param _tokenId The ID of the Animecard that can be transferred if this call succeeds.
    /// @notice Required for ERC-20 and ERC-721 compliance.
    function approve(address _to, uint256 _tokenId)
    external
    whenNotPaused {
        // Only an owner can grant transfer approval.
        require(_owns(msg.sender, _tokenId));
        // Register the approval (replacing any previous approval).
        _approve(_tokenId, _to);
        // Fire approval event upon successful approval.
        Approval(msg.sender, _to, _tokenId);
    }
}