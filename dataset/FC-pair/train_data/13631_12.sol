contract c13631{
    /**
    * @dev Transfer the specified amount of tokens to the specified address.
    *      - Invokes the `tokenFallback` function if the recipient is a contract.
    *        The token transfer fails if the recipient is a contract
    *        but does not implement the `tokenFallback` function
    *        or the fallback function to receive funds.
    *      - Records coin age if the recipient is not a contract
    *
    * @param _to    Receiver address.
    * @param _value Amount of tokens that will be transferred.
    * @param _data  Transaction metadata.
    */
    function transfer(address _to, uint256 _value, bytes _data) public whenNotPaused returns (bool) {
        require(_to != address(0));
        if (msg.sender == _to) {
            return mint();
        }
        require(_value <= balances[msg.sender]);
        bool flag = isContract(_to);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        if (flag) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.tokenFallback(msg.sender, _value, _data);
        }
        emit Transfer(msg.sender, _to, _value, _data);
        logCoinAgeRecord(msg.sender, _to, _value, flag);
        return true;
    }
}