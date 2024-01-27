contract c7044{
    /**
     * @dev Resume a previously suspended ICO.
     */
    function resume() public onlyOwner isSuspended {
        state = State.Active;
        emit ICOResumed(endAt, lowCapWei, hardCapWei, lowCapTxWei, hardCapTxWei);
        touch();
    }
}