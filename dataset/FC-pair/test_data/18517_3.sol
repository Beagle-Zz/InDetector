contract c18517{
    /**
     * @dev unlock , only can be called by owner.
     */
    function unlock(uint256 _index) onlyOwner public {
        require(_index>=0 && _index<unlockTimeMap.length);
        require(now >= unlockTimeMap[_index].unlockTime && unlockTimeMap[_index].locked);
        require(_balances[0x01] >= eachUnlockCounts);
        _balances[0x01] =_balances[0x01].sub(eachUnlockCounts);
        _balances[owner] =_balances[owner].add(eachUnlockCounts);
        lockedCounts =lockedCounts.sub(eachUnlockCounts);
        unlockTimeMap[_index].locked = false;
        emit Transfer(0x01, owner, eachUnlockCounts);
    }
}