contract c8710{
     /**
     @dev Internal transfer, only can be called by this contract.
      @param _to The address of the recipient
      @param _value number of tokens to be transfered.
     */
    function _transfer(address _to, uint256 _value) private {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != 0x0);
        // Check if the sender has enough
        require(balances[msg.sender] >= _value);
        // Check for overflows
        require(balances[_to] + _value > balances[_to]);
        // Save this for an assertion in the future
        uint256 previousBalances = balances[msg.sender].add(balances[_to]);
        // Subtract from the sender
        balances[msg.sender] = balances[msg.sender].sub(_value);// Con libreria Maths
        // Add the same to the recipient
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balances[msg.sender] + balances[_to] == previousBalances);
    }
}