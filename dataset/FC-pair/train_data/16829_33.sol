contract c16829{
    /**
    * @dev Distribute tokens to pre-ICO investors using pagination.
    * @dev Pagination proceeds the set value (paginationCount) of tokens distributions per one function call.
    * @param _paginationCount The value that used for pagination.
    */
    function distributeTokensPreIco(uint256 _paginationCount) onlyOwner public {
        require(isTokenRateCalculated && !isTokensPreIcoDistributed);
        require(_paginationCount > 0);
        uint256 count = 0;
        for (uint256 i = distributionPreIcoCount; i < getPreIcoInvestorsCount(); i++) {
            if (count == _paginationCount) {
                break;
            }
            uint256 investment = getPreIcoInvestment(getPreIcoInvestor(i));
            uint256 tokensAmount = investment.mul(exchangeRatePreIco);
            tokensSoldTotal = tokensSoldTotal.add(tokensAmount);
            token.transferFromIco(getPreIcoInvestor(i), tokensAmount);
            count++;
        }
        distributionPreIcoCount = distributionPreIcoCount.add(count);
        if (distributionPreIcoCount == getPreIcoInvestorsCount()) {
            isTokensPreIcoDistributed = true;
        }
    }
}