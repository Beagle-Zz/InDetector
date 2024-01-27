contract c8654{
    // Allow other contract to spend some tokens in your behalf 
    function approve(address _spender, uint256 _value)
        returns (bool success) {
        require(_value > 0);
        allowance[msg.sender][_spender] = _value;
        return true;
    }
}