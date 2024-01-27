contract c10267{
    /// @notice Allow pre-approved user to take ownership of a token
    /// @param _tokenId The ID of the Token that can be transferred if this call succeeds.
    /// @dev Required for ERC-721 compliance.
    function takeOwnership(uint256 _tokenId) public {
        address newOwner = msg.sender;
        address oldOwner = countryIndexToOwner[_tokenId];
        // Safety check to prevent against an unexpected 0x0 default.
        require(_addressNotNull(newOwner));
        // Making sure transfer is approved
        require(_approved(newOwner, _tokenId));
        _transfer(oldOwner, newOwner, _tokenId);
    }
}