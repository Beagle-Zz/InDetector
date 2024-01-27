contract c40249{
	 
	function createAccount () {
		accountFor(msg.sender, true);
	}
}