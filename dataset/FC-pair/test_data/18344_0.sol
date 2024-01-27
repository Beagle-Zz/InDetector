contract c18344{
    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != 0x0);
        // Check if the sender has enough
        require(_balanceOf[_from] >= _value);
        // Check for overflows
        require(_balanceOf[_to] + _value > _balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = _balanceOf[_from] + _balanceOf[_to];
        // Subtract from the sender
        _balanceOf[_from] -= _value;
        // Add the same to the recipient
        _balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(_balanceOf[_from] + _balanceOf[_to] == previousBalances);
    }
}