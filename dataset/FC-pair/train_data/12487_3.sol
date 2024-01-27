contract c12487{
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));                                 //Prevent transfer to 0x0 address. Use burn() instead
        require(_value > 0 && _value <= balances[msg.sender]);      // Check for balance
        require(balances[_to].add(_value) > balances[_to]);         // Check for overflows
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}