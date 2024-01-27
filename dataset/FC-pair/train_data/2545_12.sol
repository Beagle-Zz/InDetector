contract c2545{
    /// @dev Called by the owner if the sale has ended.
    function close() external atState(State.Success) onlyOwner {
        state = State.Closed;
        nextDisbursement = now;
        emit Closed();
    }
}