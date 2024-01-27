contract c16205{
	// Internal balance function, used to calculate the dynamic reserve value.
	function contractBalance() internal constant returns (uint256 amount){
		// msg.value is the amount of Ether sent by the transaction.
		return investSum - withdrawSum - msg.value - trickleSum;
	}
}