contract c2357{
    // get the available tokens
    function checkAvailableTokens (address addr, address tokenAddr) view public returns (uint tokenAmount) {
        Beneficiary storage b = beneficiaries[addr];
        TokenAllocation storage ta = tokenAllocationMap[tokenAddr];
        for (uint i = b.tokensClaimed[tokenAddr]; i < ta.pct.length; i++) {
            tokenAmount = tokenAmount.add(_applyPct(b.balance, ta.pct[i]));
        }
        return tokenAmount;
    }
}