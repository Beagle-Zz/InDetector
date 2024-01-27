contract c12273{
    /**
     * @dev Returns the contract state.
     */
    function getState() public view returns (State) {
        if (now >= deadline)
            return State.LOCKED;
        if (now - calcTime < RATE_PERIOD)
            return State.PROCESSING_ORDERS;
        if (waitingOracles() != 0)
            return State.WAIT_ORACLES;
        if (readyOracles() >= MIN_READY_ORACLES)
            return State.CALC_RATES;
        return State.REQUEST_RATES;
    }
}