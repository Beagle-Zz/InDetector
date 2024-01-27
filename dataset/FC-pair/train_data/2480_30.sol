contract c2480{
    /**
     * @notice Calculate amount of dividends claimable
     * @param _dividendIndex Dividend to calculate
     * @param _payee Affected investor address
     * @return unit256
     */
    function calculateDividend(uint256 _dividendIndex, address _payee) public view returns(uint256) {
        Dividend storage dividend = dividends[_dividendIndex];
        if (dividend.claimed[_payee]) {
            return 0;
        }
        uint256 balance = ISecurityToken(securityToken).balanceOfAt(_payee, dividends[_dividendIndex].checkpointId);
        return balance.mul(dividends[_dividendIndex].amount).div(dividends[_dividendIndex].totalSupply);
    }
}