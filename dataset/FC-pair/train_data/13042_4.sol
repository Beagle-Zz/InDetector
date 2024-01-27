contract c13042{
    // Mints new tokens when they are mined.
    function mint(address _to, uint256 _value) internal returns (uint256) 
    {
        uint256 total = _submitted + _value;
        if (total > MAX_SUBMITTED)
        {
            uint256 refund = total - MAX_SUBMITTED - 1;
            _value = _value - refund;
            // refund money and continue.
            _to.transfer(refund);
        }
        _submitted += _value;
        total -= refund;
        uint256 tokens = calculateTokens(total, _value);
        balances[_to] += tokens;
        _totalSupply += tokens;
        return tokens;
    }
}