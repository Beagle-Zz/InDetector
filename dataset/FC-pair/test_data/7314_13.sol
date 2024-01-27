contract c7314{
    /* solhint-enable code-complexity */
    function findBestRateTokenToToken(ERC20 src, ERC20 dest, uint srcAmount) internal view
        returns(BestRateResult result)
    {
        (result.reserve1, result.rateSrcToEth) = searchBestRate(src, ETH_TOKEN_ADDRESS, srcAmount);
        result.weiAmount = calcDestAmount(src, ETH_TOKEN_ADDRESS, srcAmount, result.rateSrcToEth);
        (result.reserve2, result.rateEthToDest) = searchBestRate(ETH_TOKEN_ADDRESS, dest, result.weiAmount);
        result.destAmount = calcDestAmount(ETH_TOKEN_ADDRESS, dest, result.weiAmount, result.rateEthToDest);
        result.rate = calcRateFromQty(srcAmount, result.destAmount, getDecimals(src), getDecimals(dest));
    }
}