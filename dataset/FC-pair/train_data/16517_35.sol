contract c16517{
    /**
     * Returns the current time.
     * Useful to abstract calls to "now" for tests.
    */
    function currentTime() public constant returns (uint _currentTime) {
        return now;
    }
}