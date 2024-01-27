contract c16323{
    // @return true if crowdsale event has ended
    function hasEnded() public constant returns (bool) {
        return now > ICOEndTime;
    }
}