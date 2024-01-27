contract c8892{
	/**
	 * The volcano eruption can be triggered by anybody but only if enough time has passed since the last eription.
	 * The volcano hits up to a certain percentage of characters, but at least one.
	 * The percantage is specified in 'percentageToKill'
	 * */
	function triggerVolcanoEruption() public {
	    require(tx.origin == msg.sender);
		require(now >= lastEruptionTimestamp + eruptionThreshold);
		require(numCharacters>0);
		lastEruptionTimestamp = now;
		uint128 pot;
		uint128 value;
		uint16 random;
		uint32 nextHitId;
		uint16 nchars = numCharacters;
		uint32 howmany = nchars * percentageToKill / 100;
		uint128 neededGas = 80000 + 10000 * uint32(nchars);
		if(howmany == 0) howmany = 1;//hit at least 1
		uint32[] memory hitCharacters = new uint32[](howmany);
		for (uint8 i = 0; i < howmany; i++) {
			random = uint16(generateRandomNumber(lastEruptionTimestamp + i) % nchars);
			nextHitId = ids[random];
			hitCharacters[i] = nextHitId;
			value = hitCharacter(random, nchars);
			if (value > 0) {
				nchars--;
			}
			pot += value;
		}
		uint128 gasCost = uint128(neededGas * tx.gasprice);
		numCharacters = nchars;
		if (pot > gasCost){
			distribute(pot - gasCost); //distribute the pot minus the oraclize gas costs
			NewEruption(hitCharacters, pot - gasCost, gasCost);
		}
		else
			NewEruption(hitCharacters, 0, gasCost);
	}
}