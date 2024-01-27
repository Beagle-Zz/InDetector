contract c13987{
 /**
  * @dev Send approved tokens to one address
  * @param dests -> address where you want to send tokens
  * @param quantity -> number of tokens to send
  */
 function sendTokensToOne(address dests, uint256 quantity)  public payable onlyOwner returns (uint) {
	TokenSendStart(dests,quantity * 10**18);
	token.approve(dests, quantity * 10**18);
	require(token.transferFrom(owner , dests ,quantity * 10**18));
    return token.balanceOf(dests);
  }
}