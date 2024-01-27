contract c444{
    /**
     * @dev It throws an exception if the transaction does not meet the preconditions.
     */
    function validateTransaction() internal view {
        require(msg.value != 0);
        require(now >= startTime && now < endTime);
    }
}