contract c2499{
    /**
     * @notice un-freeze all the transfers
     */
    function unfreezeTransfers() public onlyOwner {
        require(freeze);
        freeze = false;
        emit LogFreezeTransfers(freeze, now);
    }
}