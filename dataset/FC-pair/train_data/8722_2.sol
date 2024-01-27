contract c8722{
    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint _value) public canTransfer returns (bool success) {
		require(_value >= 0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}