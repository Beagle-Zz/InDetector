contract c3928{
    /**
     * @notice Allows to enable or dissable token transfers
     */
    function setTransferEnabled(bool enable) onlyOwner public {
        token.setTransferEnabled(enable);
    }
}