contract c18625{
    /**
     * charge fee
     */
    function charge(address _to, uint256 _amount, uint256 _timestamp) internal returns (bool) {
        require(freeBalances[msg.sender] >= _amount);
        require(_amount >= fee);
        require(_to != address(0));
        uint256 toAmt = _amount.sub(fee);
        freeBalances[msg.sender] = freeBalances[msg.sender].sub(_amount);
        freeBalances[_to] = freeBalances[_to].add(toAmt);
        // systemAcc
        frozenBalances[systemAcc] = frozenBalances[systemAcc].add(fee);
        freezeRecord[systemAcc][_timestamp] = freezeRecord[systemAcc][_timestamp].add(fee);
        Transfer(msg.sender, _to, toAmt);
        Freeze(_to, fee, _timestamp);
        return true;
    }
}