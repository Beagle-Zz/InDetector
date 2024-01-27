contract c12662{
    /**
    * @notice a function that changes state if goal reached. If the PICO didn't reach goal, it reports back to it.
    */
    function goalReached() internal {
        emit SoftcapReached(treasury, fundingGoal);
        fundingGoalReached = true;
        if (weiRaisedInPICO < fundingGoal){
            PICO.extGoalReached();
        }
    }
}