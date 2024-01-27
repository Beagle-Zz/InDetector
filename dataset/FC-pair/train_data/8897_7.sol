contract c8897{
	/**
	 * A knight may attack a dragon, but not choose which one.
	 * The value of the loser is transfered to the winner.
	 * @param knightID the ID of the knight to perfrom the attack
	 * @param knightIndex the index of the knight in the ids-array. Just needed to save gas costs.
	 *						In case it's unknown or incorrect, the index is looked up in the array.
	 * */
	function fight(uint32 knightID, uint16 knightIndex) public {
		require(tx.origin == msg.sender);
		if (knightID != ids[knightIndex])
			knightIndex = getCharacterIndex(knightID);
		Character storage knight = characters[knightID];
		require(cooldown[knightID] + CooldownThreshold <= now);
		require(knight.owner == msg.sender);
		require(knight.characterType < 2*numDragonTypes); // knight is not a balloon
		require(knight.characterType >= numDragonTypes);
		uint16 dragonIndex = getRandomDragon(knightID);
		assert(dragonIndex < maxCharacters);
		uint32 dragonID = ids[dragonIndex];
		Character storage dragon = characters[dragonID];
		uint128 value;
		uint16 base_probability;
		uint16 dice = uint16(generateRandomNumber(knightID) % 100);
		uint256 knightPower = sklToken.balanceOf(knight.owner) / 10**15 + xperToken.balanceOf(knight.owner);
		uint256 dragonPower = sklToken.balanceOf(dragon.owner) / 10**15 + xperToken.balanceOf(dragon.owner);
		if (knight.value == dragon.value) {
				base_probability = 50;
			if (knightPower > dragonPower) {
				base_probability += uint16(100 / fightFactor);
			} else if (dragonPower > knightPower) {
				base_probability -= uint16(100 / fightFactor);
			}
		} else if (knight.value > dragon.value) {
			base_probability = 100;
			if (dragonPower > knightPower) {
				base_probability -= uint16((100 * dragon.value) / knight.value / fightFactor);
			}
		} else if (knightPower > dragonPower) {
				base_probability += uint16((100 * knight.value) / dragon.value / fightFactor);
		}
		cooldown[knightID] = now;
		if (dice >= base_probability) {
			// dragon won
			value = hitCharacter(knightIndex, numCharacters);
			if (value > 0) {
				numCharacters--;
			}
			dragon.value += value;
			NewFight(dragonID, knightID, value, base_probability, dice);
		} else {
			// knight won
			value = hitCharacter(dragonIndex, numCharacters);
			if (value > 0) {
				numCharacters--;
			}
			knight.value += value;
			if (oldest == 0) findOldest();
			NewFight(knightID, dragonID, value, base_probability, dice);
		}
	}
}