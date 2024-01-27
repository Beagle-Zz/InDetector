contract c2480{
    /**
     * @notice Issuer can push dividends to provided addresses
     * @param _dividendIndex Dividend to push
     * @param _payees Addresses to which to push the dividend
     */
    function pushDividendPaymentToAddresses(uint256 _dividendIndex, address[] _payees) public withPerm(DISTRIBUTE) validDividendIndex(_dividendIndex) {
        Dividend storage dividend = dividends[_dividendIndex];
        for (uint256 i = 0; i < _payees.length; i++) {
            if (!dividend.claimed[_payees[i]]) {
                _payDividend(_payees[i], dividend, _dividendIndex);
            }
        }
    }
}