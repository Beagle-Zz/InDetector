contract c7962{
    /// @dev Transfers a Animecard to another address. If transferring to a smart
    ///  contract be VERY CAREFUL to ensure that it is aware of ERC-721 or else your
    /// Animecard may be lost forever.
    /// @param _to The address of the recipient, can be a user or contract.
    /// @param _tokenId The ID of the Animecard to transfer.
    /// @notice Required for ERC-20 and ERC-721 compliance.
    function transfer(address _to, uint256 _tokenId)
    external
    whenNotPaused {
        // Safety check to prevent against an unexpected 0x0 default.
        require(_to != address(0));
        // Disallow transfers to this contract to prevent accidental misuse.
        // The contract should never own any animecard (except very briefly
        // after a Anime card is created).
        require(_to != address(this));
        // You can only transfer your own Animecard.
        require(_owns(msg.sender, _tokenId));
        // TODO - Disallow transfer to self
        // Reassign ownership, clear pending approvals, fire Transfer event.
        _transfer(msg.sender, _to, _tokenId);
    }
}