contract c18789{
//________________________________________________
//
    /**
     * Check Crowdsale Goal and Dead Line
     */
    function checkGoalReached() afterDeadline public {
       if(crowdsaleStart == true){
            if (amountRaised >= fundingGoal){
                fundingGoalReached = true;
                GoalReached(beneficiaryFunds, amountRaised);
                crowdsaleClosed = true;               
            } 
            //
             if (amountRaised < fundingGoal)  fundingGoalReached = false;             
       }
    }
}