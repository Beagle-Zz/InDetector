contract c8715{
    /**
    * Transfer tokens from other address
    *
    * Send `_value` tokens to `_to` on behalf of `_from`
    *
    * @param _from The address of the sender
    * @param _to The address of the recipient
    * @param _value the amount to send
    */
    function transferFrom(address _from, address _to, uint256 _value)
    external
    returns(bool success) {
        require(_value <= _allowance[_from][msg.sender], "allowance too loow");     // Check allowance
        _allowance[_from][msg.sender] = _allowance[_from][msg.sender].sub(_value);
        _transfer(_from, _to, _value);
        emit Approval(_from, _to, _allowance[_from][_to]);
        return true;
    }
}