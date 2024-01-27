contract c18688{
    /*
     * @dev     Mints a FreeLOT coupon to a two match winner allowing them 
     *          a free entry to Etheraffle. Function pausable by pause toggle.
     */
    function winFreeGo(uint _week, uint _entryNum) onlyIfNotPaused internal {
        raffle[_week].entries[msg.sender][_entryNum - 1].push(1);
        freeLOT.mint(msg.sender, 1);
        emit LogFreeLOTWin(_week, msg.sender, _entryNum, 1, now);
    }
}