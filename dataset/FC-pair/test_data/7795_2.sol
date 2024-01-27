contract c7795{
    // ------------------------------------------------------------------------
    // Safele Transfer the balance from msg.sender's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address _to, uint _value) public returns (bool success) {
        // Check if the sender has enough
        require(balances[msg.sender] >= _value);
        // Check for overflows
        require(balances[_to] + _value >= balances[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balances[msg.sender] + balances[_to];
        // Subtract from the sender
        balances[msg.sender] -= _value;
        // Add the same to the recipient
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balances[msg.sender] + balances[_to] == previousBalances);
        return true;
    }
}