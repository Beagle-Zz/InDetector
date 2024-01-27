contract c18992{
	////////////////////
	// OWNER FUNCTIONS:
	////////////////////
	// Please, be aware that the owner ONLY can change:
		// 1. The owner can increase or decrease the target amount for a game. They can then call the updater function to give/receive the ether from the game.
		// 1. The wait time until a user can withdraw or transfer their tokens after purchase through the default function above ^^^
		// 2. The owner can change the maximum amount of investments allowed. This allows for early contributors to guarantee
		// 		a certain percentage of the bankroll so that their stake cannot be diluted immediately. However, be aware that the 
		//		maximum amount of investments allowed will be raised over time. This will allow for higher bets by gamblers, resulting
		// 		in higher dividends for the bankrollers
		// 3. The owner can freeze payouts to bettors. This will be used in case of an emergency, and the contract will reject all
		//		new bets as well. This does not mean that bettors will lose their money without recompense. They will be allowed to call the 
		// 		"refund" function in the respective game smart contract once payouts are un-frozen.
		// 4. Finally, the owner can modify and withdraw the developers reward, which will fund future development, including new games, a sexier frontend,
		// 		and TRUE DAO governance so that onlyOwner functions don't have to exist anymore ;) and in order to effectively react to changes 
		// 		in the market (lower the percentage because of increased competition in the blockchain casino space, etc.)
	function transferOwnership(address newOwner) public {
		require(msg.sender == OWNER);
		OWNER = newOwner;
	}
}