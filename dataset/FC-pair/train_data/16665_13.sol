contract c16665{
    /** 
    *   @dev Allows owner to transfer out any accidentally sent ERC20 tokens
    *   @param tokenAddress  token address
    *   @param tokens        transfer amount
    */
    function transferAnyTokens(address tokenAddress, uint tokens) 
        public
        onlyOwner 
        returns (bool success) {
        return ERC20(tokenAddress).transfer(owner, tokens);
    }
}