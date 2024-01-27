contract c7314{
    /* solhint-enable function-max-lines */
    function calcActualAmounts (ERC20 src, ERC20 dest, uint srcAmount, uint maxDestAmount, BestRateResult rateResult)
        internal view returns(uint actualSrcAmount, uint weiAmount, uint actualDestAmount)
    {
        if (rateResult.destAmount > maxDestAmount) {
            actualDestAmount = maxDestAmount;
            weiAmount = calcSrcAmount(ETH_TOKEN_ADDRESS, dest, actualDestAmount, rateResult.rateEthToDest);
            actualSrcAmount = calcSrcAmount(src, ETH_TOKEN_ADDRESS, weiAmount, rateResult.rateSrcToEth);
            require(actualSrcAmount <= srcAmount);
        } else {
            actualDestAmount = rateResult.destAmount;
            actualSrcAmount = srcAmount;
            weiAmount = rateResult.weiAmount;
        }
    }
}