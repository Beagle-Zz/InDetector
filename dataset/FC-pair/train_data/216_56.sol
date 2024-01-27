contract c216{
    /// @dev requires that the user isnt feeding a horsey already
    modifier onlyOwnerOf(uint256 tokenId) {
        require(stables.ownerOf(tokenId) == msg.sender, "Caller is not owner of this token");
        _;
    }
}