contract c8371{
    /* A contract attempts to get the coins */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
		require(_value <= allowance[_from][msg.sender]);  // Check allowance 
        allowance[_from][msg.sender] = SafeMath.safeSub(allowance[_from][msg.sender], _value);
		_transfer(_from, _to, _value);
        Transfer(_from, _to, _value);
        return true;
    }
}