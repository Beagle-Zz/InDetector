contract c9949{
    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) isRunning returns (bool success) {
		if (_value <= 0) throw; 
        allowance[msg.sender][_spender] = _value;
        return true;
    }
}