contract c215{
    /// @dev requires token to be on the market = current owner is exchange
    modifier isOnMarket(uint256 tokenId) {
        require(token.ownerOf(tokenId) == address(this),"Token not on market");
        _;
    }
}