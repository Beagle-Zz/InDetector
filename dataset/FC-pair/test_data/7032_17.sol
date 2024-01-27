contract c7032{
    //@dev when srcQty too small or 0 the expected rate will be calculated without quantity,
    // will enable rate reference before committing to any quantity
    //@dev when srcQty too small (no actual dest qty) slippage rate will be 0.
    function getExpectedRate(ERC20 src, ERC20 dest, uint srcQty)
        public view
        returns (uint expectedRate, uint slippageRate)
    {
        require(quantityFactor != 0);
        require(srcQty <= MAX_QTY);
        require(srcQty * quantityFactor <= MAX_QTY);
        if (srcQty == 0) srcQty = 1;
        uint bestReserve;
        uint worstCaseSlippageRate;
        (bestReserve, expectedRate) = kyberNetwork.findBestRate(src, dest, srcQty);
        (bestReserve, slippageRate) = kyberNetwork.findBestRate(src, dest, (srcQty * quantityFactor));
        if (expectedRate == 0) {
            expectedRate = expectedRateSmallQty(src, dest);
        }
        require(expectedRate <= MAX_RATE);
        worstCaseSlippageRate = ((10000 - worstCaseRateFactorInBps) * expectedRate) / 10000;
        if (slippageRate >= worstCaseSlippageRate) {
            slippageRate = worstCaseSlippageRate;
        }
        return (expectedRate, slippageRate);
    }
}