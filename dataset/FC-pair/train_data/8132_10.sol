contract c8132{
    /**
     * @dev Reclaim all ERC20 compatible tokens
     * @param _token ERC20 The address of the token contract
     */
    function reclaimToken(ERC20 _token) external onlyOwner {
        require(!isActive());
        uint256 tokenBalance = _token.balanceOf(this);
        require(_token.transfer(owner, tokenBalance));
    }
}