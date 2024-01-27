contract c10096{
    /**
     * Returns upgrade freeze-time start.
     *
     * @return freeze-time start.
     */
    function getPendingVersionTimestamp() constant returns(uint) {
        return pendingVersionTimestamp;
    }
}