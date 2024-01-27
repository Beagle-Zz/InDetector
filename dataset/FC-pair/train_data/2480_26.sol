contract c2480{
    /**
     * @notice Issuer can push dividends using the investor list from the security token
     * @param _dividendIndex Dividend to push
     * @param _start Index in investor list at which to start pushing dividends
     * @param _iterations Number of addresses to push dividends for
     */
    function pushDividendPayment(uint256 _dividendIndex, uint256 _start, uint256 _iterations) public withPerm(DISTRIBUTE) validDividendIndex(_dividendIndex) {
        Dividend storage dividend = dividends[_dividendIndex];
        uint256 numberInvestors = ISecurityToken(securityToken).getInvestorsLength();
        for (uint256 i = _start; i < Math.min256(numberInvestors, _start.add(_iterations)); i++) {
            address payee = ISecurityToken(securityToken).investors(i);
            if (!dividend.claimed[payee]) {
                _payDividend(payee, dividend, _dividendIndex);
            }
        }
    }
}