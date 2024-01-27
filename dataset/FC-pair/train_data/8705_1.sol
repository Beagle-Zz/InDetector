contract c8705{
    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
		if (_value <= 0) revert();//throw; 
        allowance[msg.sender][_spender] = _value;
        return true;
    }
}