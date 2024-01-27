contract c16415{
    /// @dev Cancels the input order.
    /// @param orderAddresses Array of order's maker, taker, makerToken, takerToken, and feeRecipient.
    /// @param orderValues Array of order's makerTokenAmount, takerTokenAmount, makerFee, takerFee, expirationTimestampInSec, and salt.
    /// @param cancelTakerTokenAmount Desired amount of takerToken to cancel in order.
    /// @return Amount of takerToken cancelled.
    function cancelOrder(
        address[5] orderAddresses,
        uint[6] orderValues,
        uint cancelTakerTokenAmount)
        public
        onlyWhitelisted
        returns (uint)
    {
        Order memory order = Order({
            maker: orderAddresses[0],
            taker: orderAddresses[1],
            makerToken: orderAddresses[2],
            takerToken: orderAddresses[3],
            feeRecipient: orderAddresses[4],
            makerTokenAmount: orderValues[0],
            takerTokenAmount: orderValues[1],
            makerFee: orderValues[2],
            takerFee: orderValues[3],
            expirationTimestampInSec: orderValues[4],
            orderHash: getOrderHash(orderAddresses, orderValues)
        });
        require(order.maker == msg.sender);
        require(order.makerTokenAmount > 0 && order.takerTokenAmount > 0 && cancelTakerTokenAmount > 0);
        if (block.timestamp >= order.expirationTimestampInSec) {
            LogError(uint8(Errors.ORDER_EXPIRED), order.orderHash);
            return 0;
        }
        uint remainingTakerTokenAmount = safeSub(order.takerTokenAmount, getUnavailableTakerTokenAmount(order.orderHash));
        uint cancelledTakerTokenAmount = min256(cancelTakerTokenAmount, remainingTakerTokenAmount);
        if (cancelledTakerTokenAmount == 0) {
            LogError(uint8(Errors.ORDER_FULLY_FILLED_OR_CANCELLED), order.orderHash);
            return 0;
        }
        cancelled[order.orderHash] = safeAdd(cancelled[order.orderHash], cancelledTakerTokenAmount);
        LogCancel(
            order.maker,
            order.feeRecipient,
            order.makerToken,
            order.takerToken,
            getPartialAmount(cancelledTakerTokenAmount, order.takerTokenAmount, order.makerTokenAmount),
            cancelledTakerTokenAmount,
            keccak256(order.makerToken, order.takerToken),
            order.orderHash
        );
        return cancelledTakerTokenAmount;
    }
}