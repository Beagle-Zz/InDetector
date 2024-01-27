contract c7606{
    /**
     * withdraw foreign tokens
     */
    function withdrawForeignTokens(address _tokenContract) onlyOwner public returns (bool) {
        ERC20Basic token = ERC20Basic(_tokenContract);
        uint256 amount = token.balanceOf(address(this));
        return token.transfer(owner, amount);
    }
}