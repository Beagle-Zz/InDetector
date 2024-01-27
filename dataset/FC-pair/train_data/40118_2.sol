contract c40118{
	 
	 
   
	function withdrawEtherOrThrow(uint256 amount) private {
    if (msg.sender != owner) throw;
		bool result = owner.call.value(amount)();
		if (!result) {
			throw;
		}
	}
}