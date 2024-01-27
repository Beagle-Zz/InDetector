contract c2755{
    /**
     * @dev Closes the refund safe.
     */
    function close() onlyOwner public {
        require(state == State.ACTIVE);
        state = State.CLOSED;
        emit RefundsClosed();
        beneficiary.transfer(address(this).balance);
    }
}