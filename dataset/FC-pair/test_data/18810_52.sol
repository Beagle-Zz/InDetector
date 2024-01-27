contract c18810{
    /* Update the current ether price and update the last updated time,
     * refreshing the price staleness.
     * Also checks whether the contract's collateral levels have fallen to low,
     * and initiates liquidation if that is the case.
     * Exceptional conditions:
     *     Not called by the oracle.
     *     Not the most recently sent price. */
    function updatePrice(uint price, uint timeSent)
        external
        postCheckAutoLiquidate
    {
        // Should be callable only by the oracle.
        require(msg.sender == oracle);
        // Must be the most recently sent price, but not too far in the future.
        // (so we can't lock ourselves out of updating the oracle for longer than this)
        require(lastPriceUpdateTime < timeSent && timeSent < now + 10 minutes);
        etherPrice = price;
        lastPriceUpdateTime = timeSent;
        emit PriceUpdated(price);
    }
}