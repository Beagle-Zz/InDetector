contract c85{
    // overriding Crowdsale#hasEnded to add cap logic
    // @return true if crowdsale event has ended
    function hasEnded() public constant returns (bool) {
        bool capReached = weiRaised >= hardCap;
        return (endTime != 0 && now > endTime) || capReached;
    }
}