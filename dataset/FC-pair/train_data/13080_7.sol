contract c13080{
    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) public whenNotPaused  returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit  Approval(msg.sender, _spender, _value);
        return true;
    }
}