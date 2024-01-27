contract c16701{
    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value) external returns (bool success) {
        assert(_value > 0);
        allowance[msg.sender][_spender] = _value;
        return true;
    }
}