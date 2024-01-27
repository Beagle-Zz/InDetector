contract c16428{
    // @return true if crowdsale event has started
    function hasStarted() public constant returns (bool) {
        return (startTime != 0 && now > startTime);
    }
}