contract c16197{
    // After Phase 1
    /// Checks the results of the first phase
    /// Changes state only once
    function finaliseFirstPhase()
        public
        when_not_halted
        when_active
        after_phase_1
        returns(uint256)
    {
        if (auctionEndPrice == 0) {
            auctionEndPrice = totalAccounted.div(tokenCapPhaseOne);
            PhaseOneEnded(auctionEndPrice);
            // check if second phase should be engaged
            if (totalAccounted >= FUNDING_GOAL ) {
                // funding goal is reached: phase 2 is not engaged, all auction participants receive additional bonus, campaign is ended
                auctionSuccessBonus = SUCCESS_BONUS;
                endTime = firstPhaseEndTime;
                campaignEnded = true;
                tokenContract.setTokenStart(endTime);
                Ended(true);
            }
            else if (auctionEndPrice >= TOKEN_MIN_PRICE_THRESHOLD) {
                // funding goal is not reached, auctionEndPrice is above or equal to threshold value: engage phase 2
                fixedPrice = auctionEndPrice.add(auctionEndPrice.mul(SECOND_PHASE_PRICE_FACTOR).div(100));
                secondPhaseStartTime = now;
                endTime = secondPhaseStartTime.add(SECOND_PHASE_MAX_SPAN);
                PhaseTwoStared(fixedPrice);
            }
            else if (auctionEndPrice < TOKEN_MIN_PRICE_THRESHOLD && auctionEndPrice > 0){
                // funding goal is not reached, auctionEndPrice is below threshold value: phase 2 is not engaged, campaign is ended
                endTime = firstPhaseEndTime;
                campaignEnded = true;
                tokenContract.setTokenStart(endTime);
                Ended(false);
            }
            else { // no one came, we are all alone in this world :(
                auctionEndPrice = 1 wei;
                endTime = firstPhaseEndTime;
                campaignEnded = true;
                tokenContract.setTokenStart(endTime);
                Ended(false);
                Retired();
            }
        }
        return auctionEndPrice;
    }
}