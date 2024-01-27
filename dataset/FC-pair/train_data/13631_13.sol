contract c13631{
    /**
    * @dev Transfer the specified amount of tokens to the specified address.
    *      This function works the same with the previous one
    *      but doesn't contain `_data` param.
    *      Added due to backwards compatibility reasons.
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
        require(_to != address(0));
        if (msg.sender == _to) {
            return mint();
        }
        require(_value <= balances[msg.sender]);
        bytes memory empty;
        bool flag = isContract(_to);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        if (flag) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.tokenFallback(msg.sender, _value, empty);
        }
        emit Transfer(msg.sender, _to, _value, empty);
        logCoinAgeRecord(msg.sender, _to, _value, flag);
        return true;
    }
}