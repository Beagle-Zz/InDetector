contract c40413{
	 
	function withdrawEtherOrThrow(uint256 amount) {
		bool result = msg.sender.call.value(amount)();
		if (!result) {
			throw;
		}
	}
}