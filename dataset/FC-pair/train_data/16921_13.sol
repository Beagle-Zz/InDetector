contract c16921{
    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @dev This works identically to the other function with an extra data parameter,
    ///  except this function just sets data to ""
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) 
        external whenNotPaused canBeStoredIn40Bits(_tokenId)
    {
        require(_to != address(0));
        require(_to != address(this));
        require(_to != address(saleMarket));
        require(_to != address(breedingMarket));
        // Check for approval and valid ownership
        require(_approvedFor(msg.sender, uint40(_tokenId)) || _isApprovedForAll(_from, msg.sender));
        require(_isOwner(_from, uint40(_tokenId)));
        // Reassign ownership, clearing pending approvals and emitting Transfer event.
        _transfer(_from, _to, uint40(_tokenId));
    }
}