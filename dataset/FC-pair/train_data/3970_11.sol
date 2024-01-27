contract c3970{
    /// @dev allocates tokens to pre-sell address.
    function allocateToken (address _addr, uint256 _eth) isOwner external {
        if (_eth == 0) throw;
        if (_addr == address(0x0)) throw;
        uint256 tokens = safeMult(formatDecimals(_eth), tokenExchangeRate);
        if (tokens + tokenRaised > currentSupply) throw;
        tokenRaised = safeAdd(tokenRaised, tokens);
        balances[_addr] += tokens;
        AllocateToken(_addr, tokens);  // logs token issued
    }
}