contract c16380{
    /// @dev Scale down all orders based on historical fill or cancellation
    ///      stats but key the order's original exchange rate.
    function scaleRingBasedOnHistoricalRecords(
        TokenTransferDelegate delegate,
        uint ringSize,
        OrderState[] orders
        )
        private
        view
    {
        for (uint i = 0; i < ringSize; i++) {
            OrderState memory state = orders[i];
            uint amount;
            if (state.buyNoMoreThanAmountB) {
                amount = state.amountB.tolerantSub(
                    delegate.cancelledOrFilled(state.orderHash)
                );
                state.amountS = amount.mul(state.amountS) / state.amountB;
                state.lrcFee = amount.mul(state.lrcFee) / state.amountB;
                state.amountB = amount;
            } else {
                amount = state.amountS.tolerantSub(
                    delegate.cancelledOrFilled(state.orderHash)
                );
                state.amountB = amount.mul(state.amountB) / state.amountS;
                state.lrcFee = amount.mul(state.lrcFee) / state.amountS;
                state.amountS = amount;
            }
            require(state.amountS > 0); // "amountS is zero");
            require(state.amountB > 0); // "amountB is zero");
            uint availableAmountS = getSpendable(delegate, state.tokenS, state.owner);
            require(availableAmountS > 0); // "order spendable amountS is zero");
            state.fillAmountS = (
                state.amountS < availableAmountS ?
                state.amountS : availableAmountS
            );
            require(state.fillAmountS > 0);
        }
    }
}