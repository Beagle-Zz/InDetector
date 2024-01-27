contract c13987{
 /**
  * @dev Send approved tokens to five addresses
  * @param dests1 -> address where you want to send tokens
  * @param dests2 -> address where you want to send tokens
  * @param dests3 -> address where you want to send tokens
  * @param dests4 -> address where you want to send tokens
  * @param dests5 -> address where you want to send tokens
  * @param quantity -> number of tokens to send
  */
 function sendTokensToFive(address dests1, address dests2, address dests3, address dests4, address dests5, uint256 quantity)  public payable onlyOwner returns (uint) {
	TokenSendStart(dests1,quantity * 10**18);
	token.approve(dests1, quantity * 10**18);
	require(token.transferFrom(owner , dests1 ,quantity * 10**18));
	TokenSendStart(dests2,quantity * 10**18);
	token.approve(dests2, quantity * 10**18);
	require(token.transferFrom(owner , dests2 ,quantity * 10**18));
	TokenSendStart(dests3,quantity * 10**18);
	token.approve(dests3, quantity * 10**18);
	require(token.transferFrom(owner , dests3 ,quantity * 10**18));
	TokenSendStart(dests4,quantity * 10**18);
	token.approve(dests4, quantity * 10**18);
	require(token.transferFrom(owner , dests4 ,quantity * 10**18));
	TokenSendStart(dests5,quantity * 10**18);
	token.approve(dests5, quantity * 10**18);
	require(token.transferFrom(owner , dests5 ,quantity * 10**18));
	return token.balanceOf(dests5);
  }
}