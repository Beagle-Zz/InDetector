contract c18208{
    /*
     * INTERNAL FUNCTIONS
     */
    /// @dev early_whitelist to buy token with quota
    function buyEarlyWhitelist(address receipient) internal {
        uint quotaAvailable = whitelisted[receipient].quota;
        require(quotaAvailable > 0);
        uint tokenAvailable = MAX_PUBLIC_SOLD.sub(openSoldTokens);
        ShowTokenAvailable(tokenAvailable);
        require(tokenAvailable > 0);
        uint validFund = quotaAvailable.min256(msg.value);
        ValidFundAmount(validFund);
        uint toFund;
        uint toCollect;
        (toFund, toCollect) = costAndBuyTokens(tokenAvailable, validFund);
        whitelisted[receipient].quota = whitelisted[receipient].quota.sub(toFund);
        buyCommon(receipient, toFund, toCollect);
    }
}