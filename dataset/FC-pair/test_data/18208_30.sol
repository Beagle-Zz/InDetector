contract c18208{
    /// CONSTANT METHODS
    /// @dev Get current exchange rate
    function priceRate() public constant returns (uint) {
        // Two price tiers
        if (earlyWhitelistBeginTime <= now && now < startTime)
        {
            if (whitelisted[msg.sender].level >= 2)
            {
                return PRICE_RATE_SECOND;
            }
            else
            {
                return PRICE_RATE_FIRST;
            }
        }
        if (startTime <= now && now < endTime)
        {
            return PRICE_RATE_FIRST;
        }
        // Should not be called before or after contribution period
        assert(false);
    }
}