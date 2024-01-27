contract c8911{
    /// @return true if the hard cap is reached.
    function hardCapReached() constant returns (bool) {
        return totalEthReceived >= HARD_CAP;
    }
}