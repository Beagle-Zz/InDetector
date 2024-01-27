contract c16921{
    /// @notice Transfers a Cutie to another address. When transferring to a smart
    ///  contract, ensure that it is aware of ERC-721 (or
    ///  BlockchainCuties specifically), otherwise the Cutie may be lost forever.
    /// @param _to The address of the recipient, can be a user or contract.
    /// @param _cutieId The ID of the Cutie to transfer.
    /// @dev Required for ERC-721 compliance.
    function transfer(address _to, uint256 _cutieId) external whenNotPaused canBeStoredIn40Bits(_cutieId)
    {
        // You can only send your own cutie.
        require(_isOwner(msg.sender, uint40(_cutieId)));
        // Reassign ownership, clear pending approvals, emit Transfer event.
        _transfer(msg.sender, _to, uint40(_cutieId));
    }
}