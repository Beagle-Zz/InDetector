contract c18992{
	// HELPER FUNCTION TO:
	// determine the payout given dial locations based on this table
	// hardcoded payouts data:
	// 			LANDS ON 				//	PAYS  //
	////////////////////////////////////////////////
	// Bronze E -> Silver E -> Gold E	//	5000  //
	// 3x Gold Ether					//	1777  //
	// 3x Silver Ether					//	250   //
	// 3x Bronze Ether					//	250   //
	// Bronze P -> Silver P -> Gold P	//	90    //
	// 3x any Ether 					//	70    //
	// 3x Gold Planet 					//	50    //
	// 3x Silver Planet					//	25    //
	// Any Gold P & Silver P & Bronze P //	15    //
	// 3x Bronze Planet					//	10    //
	// Any 3 planet type				//	3     //
	// Any 3 gold						//	3     //
	// Any 3 silver						//	2     //
	// Any 3 bronze						//	2     //
	// Blank, blank, blank				//	1     //
	// else								//  0     //
	////////////////////////////////////////////////
	function determinePayout(uint8 dial1, uint8 dial2, uint8 dial3) internal pure returns(uint256) {
		if (dial1 == 6 || dial2 == 6 || dial3 == 6){
			// all blank
			if (dial1 == 6 && dial2 == 6 && dial3 == 6)
				return 1;
		}
		else if (dial1 == 5){
			// bronze planet -> silver planet -> gold planet
			if (dial2 == 4 && dial3 == 3) 
				return 90;
			// one gold planet, one silver planet, one bronze planet, any order!
			// note: other order covered above, return 90
			else if (dial2 == 3 && dial3 == 4)
				return 15;
			// all bronze planet 
			else if (dial2 == 5 && dial3 == 5) 
				return 10;
			// any three planet type 
			else if (dial2 >= 3 && dial2 <= 5 && dial3 >= 3 && dial3 <= 5)
				return 3;
			// any three bronze 
			else if ((dial2 == 2 || dial2 == 5) && (dial3 == 2 || dial3 == 5))
				return 2;
		}
		else if (dial1 == 4){
			// all silver planet
			if (dial2 == 4 && dial3 == 4)
				return 25;
			// one gold planet, one silver planet, one bronze planet, any order!
			else if ((dial2 == 3 && dial3 == 5) || (dial2 == 5 && dial3 == 3))
				return 15;
			// any three planet type 
			else if (dial2 >= 3 && dial2 <= 5 && dial3 >= 3 && dial3 <= 5)
				return 3;
			// any three silver
			else if ((dial2 == 1 || dial2 == 4) && (dial3 == 1 || dial3 == 4))
				return 2;
		}
		else if (dial1 == 3){
			// all gold planet
			if (dial2 == 3 && dial3 == 3)
				return 50;
			// one gold planet, one silver planet, one bronze planet, any order!
			else if ((dial2 == 4 && dial3 == 5) || (dial2 == 5 && dial3 == 4))
				return 15;
			// any three planet type 
			else if (dial2 >= 3 && dial2 <= 5 && dial3 >= 3 && dial3 <= 5)
				return 3;
			// any three gold
			else if ((dial2 == 0 || dial2 == 3) && (dial3 == 0 || dial3 == 3))
				return 3;
		}
		else if (dial1 == 2){
			if (dial2 == 1 && dial3 == 0)
				return 5000; // jackpot!!!!
			// all bronze ether
			else if (dial2 == 2 && dial3 == 2)
				return 250;
			// all some type of ether
			else if (dial2 >= 0 && dial2 <= 2 && dial3 >= 0 && dial3 <= 2)
				return 70;
			// any three bronze
			else if ((dial2 == 2 || dial2 == 5) && (dial3 == 2 || dial3 == 5))
				return 2;
		}
		else if (dial1 == 1){
			// all silver ether 
			if (dial2 == 1 && dial3 == 1)
				return 250;
			// all some type of ether
			else if (dial2 >= 0 && dial2 <= 2 && dial3 >= 0 && dial3 <= 2)
				return 70;
			// any three silver
			else if ((dial2 == 1 || dial2 == 4) && (dial3 == 1 || dial3 == 4))
				return 3;
		}
		else if (dial1 == 0){
			// all gold ether
			if (dial2 == 0 && dial3 == 0)
				return 1777;
			// all some type of ether
			else if (dial2 >= 0 && dial2 <= 2 && dial3 >= 0 && dial3 <= 2)
				return 70;
			// any three gold
			else if ((dial2 == 0 || dial2 == 3) && (dial3 == 0 || dial3 == 3))
				return 3;
		}
		return 0;
	}
}