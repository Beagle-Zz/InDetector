contract c16028{
    /**
     * @dev function to make sure the balance is not locked
     * @param _addr address
     * @param _value uint256
     */
    function checkNotLocked(address _addr, uint256 _value) internal view returns (bool) {
        uint256 balance = balances[_addr].sub(_value);
        if (releaseTimeMap[_addr] > block.timestamp && balance < lockedBalanceMap[_addr]) {
            revert();
        }
        return true;
    }
}