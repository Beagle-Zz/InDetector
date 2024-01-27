contract c18894{
//_________________________________________________________
    /**
     * Transfer tokens from other address
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint valtmp = _value;
        uint _valueA = valtmp;
        valtmp = 0;
        require(_valueA <= allowance[_from][msg.sender]);     
        allowance[_from][msg.sender] = safeSub(allowance[_from][msg.sender], _valueA);
        _transfer(_from, _to, _valueA);
        _valueA = 0;
        return true;
    }
}