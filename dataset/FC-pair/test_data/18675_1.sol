contract c18675{
    /*
     * @dev     Function used to redeem promotional LOT owed. Use weekNo of 
     *          0 to get current week number. Requires user not to have already 
     *          claimed week number in question's earnt promo LOT and for promo 
     *          to be active. It calculates LOT owed, and sends them to the 
     *          caller. Should contract's LOT balance fall too low, attempts 
     *          to redeem will arrest the contract to await a resupply of LOT.
     */
    function redeem(uint _weekNo) public {
        uint week    = _weekNo == 0 ? getWeek() : _weekNo;
        uint entries = getNumEntries(msg.sender, week);
        require(
            !claimed[msg.sender][week] &&
            entries > 0 &&
            isActive
            );
        uint amt = getPromoLOTEarnt(entries);
        if (getLOTBalance(this) < amt) {
            isActive = false;
            emit LogActiveStatus(false, now);
            return;
        }
        claimed[msg.sender][week] = true;
        LOTContract.transfer(msg.sender, amt);
        emit LogLOTClaim(msg.sender, amt, week, now);
    }
}