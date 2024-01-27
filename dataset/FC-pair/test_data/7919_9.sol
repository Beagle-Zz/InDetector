contract c7919{
    // ------------------------------------------------------------------------
    // Interface to the web app.
    // Its Keccak-256 hash value is 0xc59d4847
    // ------------------------------------------------------------------------
    function getStats() constant public returns (uint256, uint256, uint256, bool) {
        return (totalContribution, totalIssued, totalBonusTokensIssued, purchasingAllowed);
    }
}