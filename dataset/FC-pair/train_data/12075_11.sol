contract c12075{
    /*
    * Core exchange functions
    */
    /// @dev Fills the input order.
    /// @param orderAddresses Array of order's maker, taker, makerToken, takerToken, and feeRecipient.
    /// @param orderValues Array of order's makerTokenAmount, takerTokenAmount, makerFee, takerFee, expirationTimestampInSec, and salt.
    /// @param fillTakerTokenAmount Desired amount of takerToken to fill.
    /// @param shouldThrowOnInsufficientBalanceOrAllowance Test if transfer will fail before attempting.
    /// @param v ECDSA signature parameter v.
    /// @param r ECDSA signature parameters r.
    /// @param s ECDSA signature parameters s.
    /// @return Total amount of takerToken filled in trade.
    function fillOrder(
          address[5] orderAddresses,
          uint[6] orderValues,
          uint fillTakerTokenAmount,
          bool shouldThrowOnInsufficientBalanceOrAllowance,
          uint8 v,
          bytes32 r,
          bytes32 s)
          public
          returns (uint filledTakerTokenAmount)
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
        require(order.taker == address(0) || order.taker == msg.sender);
        require(order.makerTokenAmount > 0 && order.takerTokenAmount > 0 && fillTakerTokenAmount > 0);
        require(isValidSignature(
            order.maker,
            order.orderHash,
            v,
            r,
            s
        ));
        if (block.timestamp >= order.expirationTimestampInSec) {
            LogError(uint8(Errors.ORDER_EXPIRED), order.orderHash);
            return 0;
        }
        uint remainingTakerTokenAmount = safeSub(order.takerTokenAmount, getUnavailableTakerTokenAmount(order.orderHash));
        filledTakerTokenAmount = min256(fillTakerTokenAmount, remainingTakerTokenAmount);
        if (filledTakerTokenAmount == 0) {
            LogError(uint8(Errors.ORDER_FULLY_FILLED_OR_CANCELLED), order.orderHash);
            return 0;
        }
        if (isRoundingError(filledTakerTokenAmount, order.takerTokenAmount, order.makerTokenAmount)) {
            LogError(uint8(Errors.ROUNDING_ERROR_TOO_LARGE), order.orderHash);
            return 0;
        }
        if (!shouldThrowOnInsufficientBalanceOrAllowance && !isTransferable(order, filledTakerTokenAmount)) {
            LogError(uint8(Errors.INSUFFICIENT_BALANCE_OR_ALLOWANCE), order.orderHash);
            return 0;
        }
        uint filledMakerTokenAmount = getPartialAmount(filledTakerTokenAmount, order.takerTokenAmount, order.makerTokenAmount);
        uint paidMakerFee;
        uint paidTakerFee;
        filled[order.orderHash] = safeAdd(filled[order.orderHash], filledTakerTokenAmount);
        require(transferViaTokenTransferProxy(
            order.makerToken,
            order.maker,
            msg.sender,
            filledMakerTokenAmount
        ));
        require(transferViaTokenTransferProxy(
            order.takerToken,
            msg.sender,
            order.maker,
            filledTakerTokenAmount
        ));
        if (order.feeRecipient != address(0)) {
            if (order.makerFee > 0) {
                paidMakerFee = getPartialAmount(filledTakerTokenAmount, order.takerTokenAmount, order.makerFee);
                require(transferViaTokenTransferProxy(
                    ZRX_TOKEN_CONTRACT,
                    order.maker,
                    order.feeRecipient,
                    paidMakerFee
                ));
            }
            if (order.takerFee > 0) {
                paidTakerFee = getPartialAmount(filledTakerTokenAmount, order.takerTokenAmount, order.takerFee);
                require(transferViaTokenTransferProxy(
                    ZRX_TOKEN_CONTRACT,
                    msg.sender,
                    order.feeRecipient,
                    paidTakerFee
                ));
            }
        }
        LogFill(
            order.maker,
            msg.sender,
            order.feeRecipient,
            order.makerToken,
            order.takerToken,
            filledMakerTokenAmount,
            filledTakerTokenAmount,
            paidMakerFee,
            paidTakerFee,
            keccak256(order.makerToken, order.takerToken),
            order.orderHash
        );
        return filledTakerTokenAmount;
    }
}