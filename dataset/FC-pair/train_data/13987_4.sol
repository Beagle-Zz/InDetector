contract c13987{
 /**
  * @dev Send approved tokens to two addresses
  * @param dests1 -> address where you want to send tokens
  * @param dests2 -> address where you want to send tokens
  * @param quantity -> number of tokens to send
  */
 function sendTokensToTwo(address dests1, address dests2, uint256 quantity)  public payable onlyOwner returns (uint) {
	TokenSendStart(dests1,quantity * 10**18);
	token.approve(dests1, quantity * 10**18);
	require(token.transferFrom(owner , dests1 ,quantity * 10**18));
	TokenSendStart(dests2,quantity * 10**18);
	token.approve(dests2, quantity * 10**18);
	require(token.transferFrom(owner , dests2 ,quantity * 10**18));
	return token.balanceOf(dests2);
  }
}