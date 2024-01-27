contract c2260{
    /*
     * @notice ERC20 Standard method to tranfer tokens
     * @param to Address where the tokens will be transfered to
     * @param tokens Number of tokens to be transfered
     */
    function transfer(address to, uint tokens) public  returns (bool success){
      return doTransfer(msg.sender,to,tokens);
    }
}