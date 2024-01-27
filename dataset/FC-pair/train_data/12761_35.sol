contract c12761{
    /**
    * @dev Batch token transfer. Used by contract creator to distribute initial tokens.
    *      Does not record any coinage for the owner.
    *
    * @param _recipients Array of address
    * @param _values Array of amount
    */
    function batchTransfer(address[] _recipients, uint256[] _values) public onlyOwner returns (bool) {
        require(_recipients.length > 0 && _recipients.length == _values.length);
        uint256 total = 0;
        for(uint256 i = 0; i < _values.length; i++) {
            total = total.add(_values[i]);
        }
        require(total <= balances[msg.sender]);
        uint64 _now = uint64(now);                                                                          // solium-disable-line
        for(uint256 j = 0; j < _recipients.length; j++){
            balances[_recipients[j]] = balances[_recipients[j]].add(_values[j]);
            balances[msg.sender] = balances[msg.sender].sub(_values[j]);
            emit Transfer(msg.sender, _recipients[j], _values[j]);
            coinAgeRecordMap[_recipients[j]].push(CoinAgeRecord(_values[j], _now));
            emit CoinAgeRecordEvent(_recipients[j], _values[j], _now);
        }
        return true;
    }
}