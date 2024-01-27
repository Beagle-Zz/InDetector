contract c2482{
    /**
     * @notice Internal function for paying dividends
     * @param _payee address of investor
     * @param _dividend storage with previously issued dividends
     * @param _dividendIndex Dividend to pay
     */
    function _payDividend(address _payee, Dividend storage _dividend, uint256 _dividendIndex) internal {
        uint256 claim = calculateDividend(_dividendIndex, _payee);
        _dividend.claimed[_payee] = true;
        _dividend.claimedAmount = claim.add(_dividend.claimedAmount);
        if (claim > 0) {
            if (_payee.send(claim)) {
              emit EtherDividendClaimed(_payee, _dividendIndex, claim);
            } else {
              _dividend.claimed[_payee] = false;
              emit EtherDividendClaimFailed(_payee, _dividendIndex, claim);
            }
        }
    }
}