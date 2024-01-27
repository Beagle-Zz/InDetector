contract c10854{
    // Internal Functions
    function bet(uint256 betEth, address _customerAddress)
        internal
        returns (uint256 resultNum)
    {
        // Spin the wheel
        resultNum = random(80);
        // Determine the outcome
        uint result = determinePrize(resultNum);
        uint256 returnedEth;
		if (result < 5)                                             // < 5 = WIN
		{
			uint256 wonEth;
			if (result == 0){                                       // Grand Jackpot
				wonEth = betEth.mul(9) / 10;                        // +90% of original bet
			} else if (result == 1){                                // Jackpot
				wonEth = betEth.mul(8) / 10;                        // +80% of original bet
			} else if (result == 2){                                // Grand Prize
				wonEth = betEth.mul(7) / 10;                        // +70% of original bet
			} else if (result == 3){                                // Major Prize
				wonEth = betEth.mul(6) / 10;                        // +60% of original bet
			} else if (result == 4){                                // Minor Prize
				wonEth = betEth.mul(3) / 10;                        // +30% of original bet
			}
			winEth(_customerAddress, wonEth);                       // Award the user their prize
            returnedEth = betEth.add(wonEth);
        } else if (result == 5){                                    // 5 = Refund
            returnedEth = betEth;
		}
		else {                                                      // > 5 = LOSE
			uint256 lostEth;
			if (result == 6){                                		// Minor Loss
				lostEth = betEth / 10;                    		    // -10% of original bet
			} else if (result == 7){                                // Major Loss
				lostEth = betEth / 4;                     			// -25% of original bet
			} else if (result == 8){                                // Grand Loss
				lostEth = betEth / 2;                     	        // -50% of original bet
			} else if (result == 9){                                // Total Loss
				lostEth = betEth;                                   // -100% of original bet
			}
			loseEth(_customerAddress, lostEth);                     // "Award" the user their loss
            returnedEth = betEth.sub(lostEth);
		}
        uint256 newBal = ethBalanceOf(_customerAddress);
        spinResult(_customerAddress, resultNum, result, betEth, returnedEth, newBal, now);
        return resultNum;
    }
}