contract c16921{
    /// @notice Transfers the ownership of an NFT from one address to another address.
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT. When transfer is complete, this function
    ///  checks if `_to` is a smart contract (code size > 0). If so, it calls
    ///  `onERC721Received` on `_to` and throws if the return value is not
    ///  `bytes4(keccak256("onERC721Received(address,uint256,bytes)"))`.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    /// @param data Additional data with no specified format, sent in call to `_to`
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) 
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
        ERC721TokenReceiver (_to).onERC721Received(_from, _tokenId, data);
    }
}