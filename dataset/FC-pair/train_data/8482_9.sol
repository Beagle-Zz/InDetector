contract c8482{
    // transfer balance to owner withdraw owner
  	function withdrawEther(uint256 amount) public returns (bool success){
  		require(msg.sender == tokensWallet);
      //require(msg.value == multiply(amount, ethereumWei));
      amount = amount * ethereumWei;
  		salesaccount.transfer(amount);
  		return true;
  	}
}