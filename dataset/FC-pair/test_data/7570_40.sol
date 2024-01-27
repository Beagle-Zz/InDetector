contract c7570{
    /**
    * @dev Updates fundingGoal status.
    */
    function _updateFundingGoal() internal {
        if (weiRaised.add(privateContribution) >= fundingGoal) {
            fundingGoalReached = true;
            emit GoalReached(weiRaised.add(privateContribution));
        }
        if(block.timestamp <= startTime) {
            if(weiRaised.add(privateContribution) >= presaleFundingGoal) {
                presaleFundingGoalReached = true;
                emit PresaleGoalReached(weiRaised.add(privateContribution));
            }
        }
    }
}