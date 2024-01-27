contract c40388{
	 
	function withdrawEtherOrThrow(uint256 amount) private {
		bool result = msg.sender.call.value(amount)();
		if (!result) {
			throw;
		}
	}
}