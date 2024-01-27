contract c2107{
    /*
     * @notice ERC20 Standard method to transfer tokens on someone elses behalf
     * @param from Address where the tokens are held
     * @param to Address where the tokens will be transfered to
     * @param tokens Number of tokens to be transfered
     */
    function transferFrom(address from, address to, uint tokens) public returns (bool success){
      if(allowed[from][msg.sender] > 0 && allowed[from][msg.sender] >= tokens)
      {
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        return doTransfer(from,to,tokens);
      }
      return false;
    }
}