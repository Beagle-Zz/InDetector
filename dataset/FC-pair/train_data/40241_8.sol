contract c40241{
	 
	function terminate() noEther onlyChallengeOwner {
		notifyTerminate(this.balance);
		suicide(challengeOwner);
	}
}