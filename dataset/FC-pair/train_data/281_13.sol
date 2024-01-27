contract c281{
    /**
     * Owner can allow a particular address (a crowdsale contract) to transfer tokens despite the lock up period.
     */
    function setTransferAgent(address addr, bool state) external onlyOwner inReleaseState(false) {
        transferAgents[addr] = state;
    }
}