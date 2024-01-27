contract c16431{
    // @return true if crowdsale event has started
    function hasStarted() public constant returns (bool) {
        return (startTime != 0 && now > startTime);
    }
}