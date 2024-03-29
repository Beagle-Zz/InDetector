contract c10378{
    /**
    * @dev Reclaim all ERC20Basic compatible tokens
    * @param token ERC20Basic The address of the token contract
    */
    function reclaimToken(ERC20Basic token) external onlyOwner {
        uint256 balance = token.balanceOf(this);
        token.transfer(owner, balance);
    }
}