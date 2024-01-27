contract c18729{
    // return true if crowdsale event has ended
    function hasEnded() public constant returns (bool) {
        bool capReached = weiRaised >= weiMaximumGoal;
        bool afterEndTime = now > endTime;
        return capReached || afterEndTime;
    }
}