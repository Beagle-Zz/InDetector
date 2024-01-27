contract c2386{
    /**
     * withdraw foreign tokens
     */
    function withdrawForeignTokens(address _tokenContract) public returns (bool) {
        require(msg.sender == admin);
        ERC20Basic token = ERC20Basic(_tokenContract);
        uint256 amount = token.balanceOf(address(this));
        return token.transfer(admin, amount);
    }
}