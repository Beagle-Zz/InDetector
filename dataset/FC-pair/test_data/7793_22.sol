contract c7793{
 /** 
  * function transferAirdropTokens - Transfer private tokens via AirDrop
  * @param beneficiary address where owner wants to transfer tokens
  * @param tokens value of token
  */
  function transferAirdropTokens(address[] beneficiary, uint256[] tokens) onlyOwner public {
    for (uint256 i = 0; i < beneficiary.length; i++) {
      tokens[i] = SafeMath.mul(tokens[i], 1 ether); 
      require(privateSaleSupply >= tokens[i]);
      privateSaleSupply = SafeMath.sub(privateSaleSupply, tokens[i]);
      token.mint(beneficiary[i], tokens[i]);
    }
  }
}