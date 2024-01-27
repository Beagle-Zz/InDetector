contract c40388{
	 
	function terminate() noEther onlyOwner {
		notifyTerminate(this.balance);
		suicide(owner);
	}
}