contract c4780{
    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) transable public
        returns (bool success) {
        require(_value == 0 || (allowance[msg.sender][_spender] == 0));
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}