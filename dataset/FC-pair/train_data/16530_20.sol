contract c16530{
    // must return true if crowdsale is over, but it failed
    function isFailed()
    public
    constant
    returns (bool)
    {
        return (
        // it was started
        started &&
        // crowdsale period has finished
        block.timestamp >= endTimestamp &&
        // but collected ETH is below the required minimum
        totalCollected < minimalGoal
        );
    }
}