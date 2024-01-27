contract c40248{
	 
	function DrawPrepare() noContract OnlyEnabled noEther {
		if (games[currentGame].endTimestamp > now || (games[currentGame].prepareBlock != 0 && games[currentGame].prepareBlock+(drawBlockLimit-drawBlockDelay) > block.number)) { throw; }
		games[currentGame].prepareBlock = block.number+drawBlockDelay;
		DrawPrepareEvent(games[currentGame].prepareBlock);
	}
}