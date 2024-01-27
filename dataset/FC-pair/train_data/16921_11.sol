contract c16921{
    /// @notice Grant another address the right to transfer a perticular Cutie via transferFrom().
    /// This flow is preferred for transferring NFTs to contracts.
    /// @param _to The address to be granted transfer approval. Pass address(0) to clear all approvals.
    /// @param _cutieId The ID of the Cutie that can be transferred if this call succeeds.
    /// @dev Required for ERC-721 compliance.
    function approve(address _to, uint256 _cutieId) external whenNotPaused canBeStoredIn40Bits(_cutieId)
    {
        // Only cutie's owner can grant transfer approval.
        require(_isOwner(msg.sender, uint40(_cutieId)));
        // Registering approval replaces any previous approval.
        _approve(uint40(_cutieId), _to);
        // Emit approval event.
        emit Approval(msg.sender, _to, _cutieId);
    }
}