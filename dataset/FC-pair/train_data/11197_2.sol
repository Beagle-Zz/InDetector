contract c11197{
    // Internal Functions
    function bet(uint256 initEth, address _customerAddress)
        internal
        returns (uint256 resultNum)
    {
        // Spin the wheel
        resultNum = random(80);
        // Determine the outcome
        uint result = determinePrize(resultNum);
        // Add 2% fee to devFeeBalance and remove from user's balance
        uint256 devFee = initEth / 50;
        devFeeBalance = devFeeBalance.add(devFee);
        balanceLedger_[_customerAddress] = ethBalanceOf(_customerAddress).sub(devFee);
        personalFactorLedger_[_customerAddress] = constantFactor / globalFactor;
        // Remove the dev fee from the bet amount
        uint256 betEth = initEth - devFee;
        uint256 returnedEth;
        uint256 prizePool = betPool(_customerAddress);
		if (result < 5)                                             // < 5 = WIN
		{
			uint256 wonEth;
			if (result == 0){                                       // Grand Jackpot
				wonEth = grandJackpot(betEth, prizePool);
			} else if (result == 1){                                // Jackpot
				wonEth = jackpot(betEth, prizePool);
			} else if (result == 2){                                // Grand Prize
				wonEth = betEth / 2;                                // +50% of original bet
			} else if (result == 3){                                // Major Prize
				wonEth = betEth / 4;                                // +25% of original bet
			} else if (result == 4){                                // Minor Prize
				wonEth = betEth / 10;                               // +10% of original bet
			}
			winEth(_customerAddress, wonEth);                       // Award the user their prize
            returnedEth = betEth.add(wonEth);
        } else if (result == 5){                                    // 5 = Refund
            returnedEth = betEth;
		}
		else {                                                      // > 5 = LOSE
			uint256 lostEth;
			if (result == 6){                                		// Minor Loss
				lostEth = betEth / 4;                    		    // -25% of original bet
			} else if (result == 7){                                // Major Loss
				lostEth = betEth / 2;                     			// -50% of original bet
			} else if (result == 8){                                // Grand Loss
				lostEth = betEth.mul(3) / 4;                     	// -75% of original bet
			} else if (result == 9){                                // Total Loss
				lostEth = betEth;                                   // -100% of original bet
			}
			loseEth(_customerAddress, lostEth);                     // "Award" the user their loss
            returnedEth = betEth.sub(lostEth);
		}
        spinResult(_customerAddress, resultNum, result, betEth, returnedEth, devFee, now);
        return resultNum;
    }
}