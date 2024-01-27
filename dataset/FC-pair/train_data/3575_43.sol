contract c3575{
    /**
     * @dev Moves the refund safe into a state of refund.
     */
    function allowRefunds() onlyOwner public {
        require(state == State.ACTIVE);
        state = State.REFUNDING;
        emit RefundsAllowed();
    }
}