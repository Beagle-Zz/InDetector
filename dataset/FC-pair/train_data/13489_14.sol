contract c13489{
    /** 
     *  @dev Owner can transfer out any accidentally sent ERC20 tokens
     *  @dev Transfer the tokens from token owner's account to `to` account
     *  @param tokenAddress address where token is to be sent
     *  @param tokens  number of tokens
     */
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
}