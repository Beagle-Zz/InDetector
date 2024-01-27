contract c16963{
	///a function using safemath to work with
	///the new function
	function calNewTokens(uint256 contribution,string types) returns (uint256){
		uint256 disc = totalDiscount(currentSupply,contribution,types);
		uint256 CreatedTokens;
		if(keccak256(types)==keccak256("ethereum")) CreatedTokens = SafeMath.mul(contribution,tokensPerEther);
		else if(keccak256(types)==keccak256("bitcoin"))  CreatedTokens = SafeMath.mul(contribution,tokensPerBTC);
		uint256 tokens = SafeMath.add(CreatedTokens,SafeMath.div(SafeMath.mul(CreatedTokens,disc),100));
		return tokens;
	}
}