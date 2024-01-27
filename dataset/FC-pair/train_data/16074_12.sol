contract c16074{
    /**
     * function to check whether the sent amount is within contribution range or not
     **/ 
    function isWithinContributionRange() internal constant returns (bool)
    {
        uint timePassed = now.sub(startTime);
        timePassed = timePassed.div(1 days);
        if (timePassed<15)
            require(msg.value>=minimumContributionPresalePhase1);
        else if (timePassed>=15 && timePassed<31)
            require(msg.value>=minimumContributionPresalePhase2);
        else
            revert();   // off time - no sales during other time periods
        return true;
     }
}