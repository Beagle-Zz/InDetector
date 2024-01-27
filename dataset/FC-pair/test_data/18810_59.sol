contract c18810{
    /* Liquidation can only be stopped if the collateralisation ratio
     * of this contract has recovered above the automatic liquidation
     * threshold, for example if the ether price has increased,
     * or by including enough ether in this transaction. */
    function terminateLiquidation()
        external
        payable
        priceNotStale
        optionalProxy_onlyOwner
    {
        require(isLiquidating());
        require(_nominCap() == 0 || collateralisationRatio() >= AUTO_LIQUIDATION_RATIO);
        liquidationTimestamp = ~uint(0);
        liquidationPeriod = DEFAULT_LIQUIDATION_PERIOD;
        emit LiquidationTerminated();
    }
}