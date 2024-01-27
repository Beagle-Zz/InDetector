contract c2479{
    /**
     * @notice un-freeze all the transfers
     */
    function unfreezeTransfers() public onlyOwner {
        require(freeze);
        freeze = false;
        emit LogFreezeTransfers(freeze, now);
    }
}