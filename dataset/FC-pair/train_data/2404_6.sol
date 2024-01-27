contract c2404{
    /**
     * Transfer tokens from other address
     * Send `_value` tokens to `_to` on behalf of `_from`.
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Check allowance
        require(_value <= allowed[_from][msg.sender]);
        allowed[_from][msg.sender] = (allowed[_from][msg.sender]).sub(_value);
        _transfer(_from, _to, _value);
        return true;
    }
}