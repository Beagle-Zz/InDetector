contract c10672{
	/// Award cup to the tournament champion
	/// Can only be awarded once, and only if the tournament has finished
	function awardCup(uint8 id) external onlyOwner isPaused {
		address owner = countries[id].owner;
		require(getTime() > TOURNAMENT_ENDS);
		require(cup.owner == address(0));
		require(cup.price == 0);
		require(owner != address(0));
		cup = EthCup(owner, cupStartPrice);
	}
}