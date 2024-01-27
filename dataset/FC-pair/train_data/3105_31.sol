contract c3105{
    /**
     * @dev Contract owner can withdraw unlocked owner funds.
     * @param _period Period to withdraw funds for.
     */
    function withdrawOwner(uint _period) public onlyOwner {
        require(currentPeriodIndex() > _period);
        Period storage period = periods[_period];
        require(block.number.sub(period.started) > OWNER_LOCK_BLOCKS);
        uint balance = period.ownerLockedBalance;
        require(balance <= address(this).balance);
        delete period.ownerLockedBalance;
        ownerAlias.transfer(balance);
    }
}