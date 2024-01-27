contract c18990{
	// rescue tokens inadvertently sent to the contract address 
	function ERC20Rescue(address tokenAddress, uint256 amtTokens) public {
		require (msg.sender == OWNER);
		ERC20(tokenAddress).transfer(msg.sender, amtTokens);
	}
}