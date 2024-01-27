contract c18357{
    // ------------------------------------------------------------------------
    // Calculates the number of tokens (in unsigned integer form [decimals included]) corresponding to the weiValue passed, using the ratio specified
    // ------------------------------------------------------------------------
    function calculateTokensFromWei(uint weiValue, uint ratio) public view returns (uint numTokens) {
        uint calc1 = safeMul(weiValue, ratio);
        uint ethValue = calc1 / _factorDecimalsEthToToken;
        return ethValue;
    }
}