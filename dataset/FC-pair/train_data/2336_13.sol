contract c2336{
    /// @dev Checks if any order transfers will fail.
    /// @param order Order struct of params that will be checked.
    /// @param fillTakerTokenAmount Desired amount of takerToken to fill.
    /// @return Predicted result of transfers.
    function isTransferable(Order order, uint fillTakerTokenAmount)
        internal
        constant  // The called token contracts may attempt to change state, but will not be able to due to gas limits on getBalance and getAllowance.
        returns (bool)
    {
        address taker = msg.sender;
        uint fillMakerTokenAmount = getPartialAmount(fillTakerTokenAmount, order.takerTokenAmount, order.makerTokenAmount);
        // if (order.feeRecipient != address(0)) {
        //     bool isMakerTokenZRX = order.makerToken == ZRX_TOKEN_CONTRACT;
        //     bool isTakerTokenZRX = order.takerToken == ZRX_TOKEN_CONTRACT;
        //     uint paidMakerFee = getPartialAmount(fillTakerTokenAmount, order.takerTokenAmount, order.makerFee);
        //     uint paidTakerFee = getPartialAmount(fillTakerTokenAmount, order.takerTokenAmount, order.takerFee);
        //     uint requiredMakerZRX = isMakerTokenZRX ? safeAdd(fillMakerTokenAmount, paidMakerFee) : paidMakerFee;
        //     uint requiredTakerZRX = isTakerTokenZRX ? safeAdd(fillTakerTokenAmount, paidTakerFee) : paidTakerFee;
        //     if (   getBalance(ZRX_TOKEN_CONTRACT, order.maker) < requiredMakerZRX
        //         || getAllowance(ZRX_TOKEN_CONTRACT, order.maker) < requiredMakerZRX
        //         || getBalance(ZRX_TOKEN_CONTRACT, taker) < requiredTakerZRX
        //         || getAllowance(ZRX_TOKEN_CONTRACT, taker) < requiredTakerZRX
        //     ) return false;
        //     if (!isMakerTokenZRX && (   getBalance(order.makerToken, order.maker) < fillMakerTokenAmount // Don't double check makerToken if ZRX
        //                              || getAllowance(order.makerToken, order.maker) < fillMakerTokenAmount)
        //     ) return false;
        //     if (!isTakerTokenZRX && (   getBalance(order.takerToken, taker) < fillTakerTokenAmount // Don't double check takerToken if ZRX
        //                              || getAllowance(order.takerToken, taker) < fillTakerTokenAmount)
        //     ) return false;
        // } else if (   getBalance(order.makerToken, order.maker) < fillMakerTokenAmount
        //            || getAllowance(order.makerToken, order.maker) < fillMakerTokenAmount
        //            || getBalance(order.takerToken, taker) < fillTakerTokenAmount
        //            || getAllowance(order.takerToken, taker) < fillTakerTokenAmount
        // ) return false;
        ///////// added code, copied from above ///////
        if (   getBalance(order.makerToken, order.maker) < fillMakerTokenAmount
                   || getAllowance(order.makerToken, order.maker) < fillMakerTokenAmount
                   || getBalance(order.takerToken, taker) < fillTakerTokenAmount
                   || getAllowance(order.takerToken, taker) < fillTakerTokenAmount
        ) return false;
        return true;
    }
}