contract c13307{
	// ------------------------------------------------------------------------
	// Owner can transfer out any accidentally sent ERC20 tokens
	// ------------------------------------------------------------------------
	function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool) {
		return ERC20Interface(tokenAddress).transfer(owner, tokens);
	}	
}