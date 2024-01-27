contract c13042{
    // Calculates the tokens mined based on the tier.
    function calculateTokens(uint256 total, uint256 _value) internal returns (uint256)
    {
        if (tier == 10) 
        {
            // This just rounds it off to an even number.
            return 74000;
        }
        uint256 tokens = 0;
        if (total > levels[tier])
        {
            uint256 remaining = total - levels[tier];
            _value -= remaining;
            tokens = (_value) * ratios[tier];
            tier += 1;
            tokens += calculateTokens(total, remaining);
        }
        else
        {
            tokens = _value * ratios[tier];
        }
        return tokens;
    }
}