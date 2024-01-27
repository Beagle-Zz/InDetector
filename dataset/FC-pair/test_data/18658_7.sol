contract c18658{
    /// @notice Transfers a Pixel to another address. If transferring to a smart
    ///  contract be VERY CAREFUL to ensure that it is aware of ERC-721 (or
    ///  PixelCoins specifically) or your Pixel may be lost forever. Seriously.
    /// @param _to The address of the recipient, can be a user or contract.
    /// @param _tokenId The ID of the Pixel to transfer.
    /// @dev Required for ERC-721 compliance.
    function transfer(
        address _to,
        uint256 _tokenId
    )
        external
    {
        // Safety check to prevent against an unexpected 0x0 default.
        require(_to != address(0));
        // Disallow transfers to this contract to prevent accidental misuse.
        // The contract should never own any pixel (except very briefly
        // after a gen0 cat is created and before it goes on auction).
        require(_to != address(this));
        // You can only send your own pixel.
        require(_owns(msg.sender, _tokenId));
        // address is not currently managed by the contract (it is in an auction)
        require(pixelIndexToApproved[_tokenId] != address(this));
        // Reassign ownership, clear pending approvals, emit Transfer event.
        _transfer(msg.sender, _to, _tokenId);
    }
}