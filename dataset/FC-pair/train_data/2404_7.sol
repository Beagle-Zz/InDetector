contract c2404{
    /**
     * Set allowance for other address
     * Allows `_spender` to spend no more than `_value` tokens on your behalf.
     */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != 0x0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}