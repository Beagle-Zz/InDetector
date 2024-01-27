contract c2107{
    /*
     * @notice method that does the actual transfer of the tokens, to be used by both transfer and transferFrom methods
     * @param from Address where the tokens are held
     * @param to Address where the tokens will be transfered to
     * @param tokens Number of tokens to be transfered
     */
    function doTransfer(address from,address to, uint tokens) internal returns (bool success){
        if( tokens > 0 && balances[from] >= tokens){
            balances[from] = balances[from].sub(tokens);
            balances[to] = balances[to].add(tokens);
            emit Transfer(from,to,tokens);
            return true;
        }
        return false;
    }
}