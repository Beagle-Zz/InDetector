contract c8578{
    /**
     * Set the new timelock for refund reuqests
     *
     * @param newTimelock   the new timelock
     */
    function setRefundTimelock (uint newTimelock) hasNotSuicided onlyOwner public {
        require(newTimelock >= 0, "timelock has to be greater than 0");
        refundRequestTimelock = newTimelock;
        emit TimelockChanged(msg.sender, newTimelock);
    }
}