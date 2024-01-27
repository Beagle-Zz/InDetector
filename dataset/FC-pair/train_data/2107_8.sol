contract c2107{
    /*
     * @notice ERC20 Standard method to give a spender an allowance
     * @param spender Address that wil receive the allowance
     * @param tokens Number of tokens in the allowance
     */
    function approve(address spender, uint tokens) public returns (bool success){
      if(balances[msg.sender] >= tokens){
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender,spender,tokens);
        return true;
      }
      return false;
    }
}