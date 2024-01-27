contract c2480{
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
            require(ERC20(_dividend.token).transfer(_payee, claim), "Unable to transfer tokens");
            emit ERC20DividendClaimed(_payee, _dividendIndex, _dividend.token, claim);
        }
    }
}