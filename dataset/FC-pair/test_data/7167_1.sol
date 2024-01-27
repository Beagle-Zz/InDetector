contract c7167{
    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != 0x0);
        // Check if the sender has enough
        require(balanceOf[_from].balance >= _value);
        // Check for overflows
        require(balanceOf[_to].balance + _value >= balanceOf[_to].balance);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from].balance + balanceOf[_to].balance;
        // Subtract from the sender
        balanceOf[_from].balance -= uint112(_value);
        // Add the same to the recipient
        balanceOf[_to].balance = _value.add(balanceOf[_to].balance).toUINT112();
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from].balance + balanceOf[_to].balance == previousBalances);
    }
}