contract c10077{
    //3
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    //Note: returns a boolean indicating whether transfer was successful
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0)); //not sending to burn address
        require(_value <= balances[msg.sender]); // If the sender has sufficient funds to send
        require(_value>0);// and the amount is not zero or negative
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}