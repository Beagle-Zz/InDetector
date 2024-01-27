contract c7044{
    /**
     * @dev Change basic ICO parameters. Can be done only during `Suspended` state.
     * Any provided parameter is used only if it is not zero.
     * @param endAt_ ICO end date seconds since epoch. Used if it is not zero.
     * @param lowCapWei_ ICO low capacity. Used if it is not zero.
     * @param hardCapWei_ ICO hard capacity. Used if it is not zero.
     * @param lowCapTxWei_ Min limit for ICO per transaction
     * @param hardCapTxWei_ Hard limit for ICO per transaction
     */
    function tune(uint endAt_,
        uint lowCapWei_,
        uint hardCapWei_,
        uint lowCapTxWei_,
        uint hardCapTxWei_) public onlyOwner isSuspended {
        if (endAt_ > block.timestamp) {
            endAt = endAt_;
        }
        if (lowCapWei_ > 0) {
            lowCapWei = lowCapWei_;
        }
        if (hardCapWei_ > 0) {
            hardCapWei = hardCapWei_;
        }
        if (lowCapTxWei_ > 0) {
            lowCapTxWei = lowCapTxWei_;
        }
        if (hardCapTxWei_ > 0) {
            hardCapTxWei = hardCapTxWei_;
        }
        require(lowCapWei <= hardCapWei && lowCapTxWei <= hardCapTxWei);
        touch();
    }
}