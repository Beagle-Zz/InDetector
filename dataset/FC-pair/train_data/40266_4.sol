contract c40266{
	 
	function DrawPrepare() noContract OnlyEnabled noEther {
		if (games[currentGame].endTimestamp > now || games[currentGame].prepareBlock != 0) { throw; }
		games[currentGame].prepareBlock = block.number+drawBlockDelay;
		DrawPrepareEvent(games[currentGame].prepareBlock);
	}
}