contract c8897{
	/**
	 * receive approval to spend some tokens.
	 * used for teleport and protection.
	 * @param sender the sender address
	 * @param value the transferred value
	 * @param tokenContract the address of the token contract
	 * @param callData the data passed by the token contract
	 * */
	function receiveApproval(address sender, uint256 value, address tokenContract, bytes callData) public {
		uint32 id;
		uint256 price;
		if (msg.sender == address(teleportToken)) {
			id = toUint32(callData);
			price = teleportPrice * (characters[id].characterType/numDragonTypes);//double price in case of balloon
			require(value >= price);
			assert(teleportToken.transferFrom(sender, this, price));
			teleportKnight(id);
		}
		else if (msg.sender == address(neverdieToken)) {
			id = toUint32(callData);
			// user can purchase extra lifes only right after character purchaes
			// in other words, user value should be equal the initial value
			uint8 cType = characters[id].characterType;
			require(characters[id].value == values[cType]);
			// calc how many lifes user can actually buy
			// the formula is the following:
			uint256 lifePrice;
			uint8 max;
			if(cType < 2 * numDragonTypes){
				lifePrice = ((cType % numDragonTypes) + 1) * protectionPrice;
				max = 3;
			}
			else {
				lifePrice = (((cType+3) % numDragonTypes) + 1) * protectionPrice * 2;
				max = 6;
			}
			price = 0;
			uint8 i = protection[id];
			for (i; i < max && value >= price + lifePrice * (i + 1); i++) {
				price += lifePrice * (i + 1);
			}
			assert(neverdieToken.transferFrom(sender, this, price));
			protectCharacter(id, i);
		}
		else
			revert();
	}
}