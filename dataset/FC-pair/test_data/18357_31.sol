contract c18357{
    // ------------------------------------------------------------------------
    // Calculates the Eth value (in wei) corresponding to the number of tokens passed (in unsigned integer form [decimals included]), using the ratio specified
    // ------------------------------------------------------------------------
    function calculateEthValueFromTokens(uint numTokens, uint ratio) public view returns (uint weiValue) {
        uint calc1 = safeMul(numTokens, _factorDecimalsEthToToken);
        uint retValue = calc1 / ratio;
        return retValue;
    }
}