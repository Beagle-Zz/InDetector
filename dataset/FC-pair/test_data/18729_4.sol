contract c18729{
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    * @param _data Optional metadata.
    */
    function transfer(address _to, uint _value, bytes _data) public whenActivated returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require(!freezedList[msg.sender]);
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        if (isContract(_to)) {
            TokenReciever receiver = TokenReciever(_to);
            receiver.tokenFallback(msg.sender, _value, _data);
        }
        Transfer(msg.sender, _to, _value);
        Transfer(msg.sender, _to, _value, _data);
        return true;
    }
}