contract c655{
    /// @dev Is this the original owner of the token - at exchange level
    modifier originalOwnerOf(uint256 tokenId) {
        require(market[tokenId].owner == msg.sender,"Not the original owner of");
        _;
    }
}