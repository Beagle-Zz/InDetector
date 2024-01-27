contract c18918{
    /// @notice Returns the address currently assigned ownership of a given Rabbit.
    /// @dev Required for ERC-721 compliance.
    function ownerOf(uint _tokenId)
        external
        view
        returns (address owner)
    {
        owner = rabbitToOwner[_tokenId];
        require(owner != address(0));
    }
}