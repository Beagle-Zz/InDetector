contract c16541{
    /**
     * Transfer tokens from other address
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowed[_from][msg.sender]);     // Check allowance
        allowed[_from][msg.sender] = SafeMath.safeSub(allowed[_from][msg.sender], _value);
        _transfer(_from, _to, _value);
        return true;
    }
}