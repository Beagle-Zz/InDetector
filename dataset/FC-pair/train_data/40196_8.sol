contract c40196{
	 
	function createAccount () {
		accountFor(msg.sender, true);
	}
}