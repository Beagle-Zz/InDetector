contract c2013{
    /**
    * @dev Reclaim all (Except ART) ERC20Basic compatible tokens
    * @param token ERC20Basic The address of the token contract
    */
    function reclaimToken(ERC20Basic token) external onlyOwner {
        require(token != art_token_contract);
        uint256 balance = token.balanceOf(this);
        token.transfer(owner, balance);
    }
}