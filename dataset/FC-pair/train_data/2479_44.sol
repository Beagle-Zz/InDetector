contract c2479{
    /**
     * @notice freeze all the transfers
     */
    function freezeTransfers() public onlyOwner {
        require(!freeze);
        freeze = true;
        emit LogFreezeTransfers(freeze, now);
    }
}