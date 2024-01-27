contract c7044{
    /**
     * @dev Trigger start of ICO.
     * @param endAt_ ICO end date, seconds since epoch.
     */
    function start(uint endAt_) public onlyOwner {
        require(endAt_ > block.timestamp && state == State.Inactive);
        endAt = endAt_;
        startAt = block.timestamp;
        state = State.Active;
        emit ICOStarted(endAt, lowCapWei, hardCapWei, lowCapTxWei, hardCapTxWei);
    }
}