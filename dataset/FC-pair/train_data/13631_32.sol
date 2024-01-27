contract c13631{
    /**
    * @dev Logs coinage record for sender and receiver.
    *      Deletes sender's previous coinage records if any.
    *
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    * @param _isContract bool if the receiver is a contract
    */
    function logCoinAgeRecord(address _from, address _to, uint256 _value, bool _isContract) private returns (bool) {
        if (coinAgeRecordMap[_from].length > 0) {
            delete coinAgeRecordMap[_from];
        }
        uint64 _now = uint64(now);
        if (balances[_from] != 0) {
            coinAgeRecordMap[_from].push(CoinAgeRecord(balances[_from], _now));
            emit CoinAgeResetEvent(_from, balances[_from], _now);
        }
        if (_value != 0 && !_isContract) {
            coinAgeRecordMap[_to].push(CoinAgeRecord(_value, _now));
            emit CoinAgeRecordEvent(_to, _value, _now);
        }
        return true;
    }
}