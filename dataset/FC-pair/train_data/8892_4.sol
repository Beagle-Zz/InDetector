contract c8892{
	/**
	 * leave the game.
	 * pays out the sender's balance and removes him and his characters from the game
	 * */
	function exit() public {
		uint32[] memory removed = new uint32[](50);
		uint8 count;
		uint32 lastId;
		uint playerBalance;
		uint16 nchars = numCharacters;
		for (uint16 i = 0; i < nchars; i++) {
			if (characters[ids[i]].owner == msg.sender 
					&& characters[ids[i]].purchaseTimestamp + 1 days < now
					&& characters[ids[i]].characterType < 2*numDragonTypes) {
				//first delete all characters at the end of the array
				while (nchars > 0 
						&& characters[ids[nchars - 1]].owner == msg.sender 
						&& characters[ids[nchars - 1]].purchaseTimestamp + 1 days < now
						&& characters[ids[nchars - 1]].characterType < 2*numDragonTypes) {
					nchars--;
					lastId = ids[nchars];
					numCharactersXType[characters[lastId].characterType]--;
					playerBalance += characters[lastId].value;
					removed[count] = lastId;
					count++;
					if (lastId == oldest) oldest = 0;
					delete characters[lastId];
				}
				//replace the players character by the last one
				if (nchars > i + 1) {
					playerBalance += characters[ids[i]].value;
					removed[count] = ids[i];
					count++;
					nchars--;
					replaceCharacter(i, nchars);
				}
			}
		}
		numCharacters = nchars;
		NewExit(msg.sender, playerBalance, removed); //fire the event to notify the client
		msg.sender.transfer(playerBalance);
		if (oldest == 0)
			findOldest();
	}
}