contract c2107{
    /*
     * @notice ERC20 Standard method to return spending allowance
     * @param tokenOwner Owner of the tokens, who allows
     * @param spender Token spender
     */
    function allowance(address tokenOwner, address spender) public view returns (uint remaining){
      if (allowed[tokenOwner][spender] < balances[tokenOwner]) {
        return allowed[tokenOwner][spender];
      }
      return balances[tokenOwner];
    }
}