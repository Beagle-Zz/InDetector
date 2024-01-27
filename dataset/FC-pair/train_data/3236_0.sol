contract c3236{
    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) isRunning validAddress unlocked returns (bool success) {
        require(_value > 0);
        allowance[msg.sender][_spender] = _value;
		Approval(msg.sender, _spender, _value);
        return true;
    }
}