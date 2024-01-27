contract c18625{
    /**
     * distribute art coin to user.
     */
    function issue(address _addr, uint256 _amount, uint256 _timestamp) public onlyOwner returns (bool) {
        // 2018/03/23 = 1521734400
        require(frozenBalances[owner] >= _amount);
        frozenBalances[owner] = frozenBalances[owner].sub(_amount);
        frozenBalances[_addr]= frozenBalances[_addr].add(_amount);
        freezeRecord[_addr][_timestamp] = freezeRecord[_addr][_timestamp].add(_amount);
        Freeze(_addr, _amount, _timestamp);
        return true;
    }
}