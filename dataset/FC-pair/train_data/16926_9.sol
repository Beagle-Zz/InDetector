contract c16926{
    // overriding Crowdsale#hasEnded to add cap logic
    // @return true if crowdsale event has ended
    function hasEnded() public constant returns (bool) {
        bool capReached = weiRaised >= HARD_CAP;
        return super.hasEnded() || capReached;
    }
}