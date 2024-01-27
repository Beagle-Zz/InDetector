contract c10958{
    // @return true if crowdsale event has ended
    function hasEnded() public constant returns (bool) {
        return isFinalized;
    }
}