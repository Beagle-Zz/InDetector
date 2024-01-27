contract c3202{
    /**
     * Check if goal was reached
     *
     * Checks if the goal or time limit has been reached and ends the campaign
     */
    function checkGoalReached() public afterDeadline {
        if (amountRaised >= fundingGoal){
            emit GoalReached(beneficiary, amountRaised);
        }
        else
        {
	        tokenReward.transfer(beneficiary, (fundingGoal-amountRaised)  * 6  /  price);
        }
        crowdsaleClosed = true;
    }
}