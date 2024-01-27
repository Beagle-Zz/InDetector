contract c3815{
  /**
    * Function to retrieve and transfer back external tokens
    * @param anotherToken external token received
    * @param to address destination to transfer the token to
    */
  function retrieveExternalTokens(address anotherToken, address to) public onlyOwner {
    ERC20 alienToken = ERC20(anotherToken);
    alienToken.transfer(to, alienToken.balanceOf(this));
  }
}