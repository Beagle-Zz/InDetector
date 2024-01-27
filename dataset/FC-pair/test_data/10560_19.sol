contract c10560{
    // overriding Crowdsale#hasEnded to add cap logic
    // @return true if crowdsale event has ended
    function hasEnded() public view returns (bool) {
        bool capReached = weiRaised >= hardCap;
        return super.hasEnded() || capReached || isFinalized;
    }
}