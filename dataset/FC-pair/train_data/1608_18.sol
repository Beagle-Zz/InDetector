contract c1608{
    /**
     * @dev Lock the special address 
     *
     * @param _time The array of released timestamp 
     * @param _amountWithoutDecimal The array of amount of released tokens
     * NOTICE: the amount in this function not include decimals. 
     */
    function lock(address _address, uint256[] _time, uint256[] _amountWithoutDecimal) onlyAdminer public returns(bool) {
        require(!singleLockFinished[_address]);
        require(_time.length == _amountWithoutDecimal.length);
        if(locked[_address].length != 0) {
            locked[_address].length = 0;
        }
        uint256 len = _time.length;
        uint256 totalAmount = 0;
        uint256 i = 0;
        for(i = 0; i<len; i++) {
            totalAmount = totalAmount.add(_amountWithoutDecimal[i]*(10 ** decimals));
        }
        require(balances[_address] >= totalAmount);
        for(i = 0; i < len; i++) {
            locked[_address].push(lockToken(_amountWithoutDecimal[i]*(10 ** decimals), block.timestamp.add(_time[i])));
            emit Lock(_address, _amountWithoutDecimal[i]*(10 ** decimals), block.timestamp.add(_time[i]));
        }
        return true;
    }
}