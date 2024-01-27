contract c10717{
    /**
     * @notice Transfers tokens held by timelock to beneficiary.
     */
    function release() public {
        uint256 balance = token.balanceOf(address(this));
        uint256 total = add(balance, collectedTokens);
        uint256 lockTime1 = add(genTime, 183 days); // 6 months
        uint256 lockTime2 = add(genTime, 1 years); // 1 year
        uint256 currentRatio = 20;
        if (now >= lockTime1) {
            currentRatio = 50;
        }
        if (now >= lockTime2) {
            currentRatio = 100;
        }
        uint256 releasedAmount = div(mul(total, currentRatio), 100);
        uint256 grantAmount = sub(releasedAmount, collectedTokens);
        require(grantAmount > 0);
        collectedTokens = add(collectedTokens, grantAmount);
        uint256 grantAmountForEach; // = div(grantAmount, 3);
        for (uint i = 0; i < beneficiaries.length; i++) {
            grantAmountForEach = div(mul(grantAmount, ratios[i]), 100);
            token.safeTransfer(beneficiaries[i], grantAmountForEach);
        }
    }
}