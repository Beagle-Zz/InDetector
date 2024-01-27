contract c7314{
    /* solhint-disable function-max-lines */
    // Most of the lins here are functions calls spread over multiple lines. We find this function readable enough
    //  and keep its size as is.
    /// @notice use token address ETH_TOKEN_ADDRESS for ether
    /// @dev trade api for kyber network.
    /// @param tradeInput structure of trade inputs
    function trade(TradeInput tradeInput) internal returns(uint) {
        require(isEnabled);
        require(tx.gasprice <= maxGasPriceValue);
        require(validateTradeInput(tradeInput.src, tradeInput.srcAmount, tradeInput.dest, tradeInput.destAddress));
        BestRateResult memory rateResult =
        findBestRateTokenToToken(tradeInput.src, tradeInput.dest, tradeInput.srcAmount);
        require(rateResult.rate > 0);
        require(rateResult.rate < MAX_RATE);
        require(rateResult.rate >= tradeInput.minConversionRate);
        uint actualDestAmount;
        uint weiAmount;
        uint actualSrcAmount;
        (actualSrcAmount, weiAmount, actualDestAmount) = calcActualAmounts(tradeInput.src,
            tradeInput.dest,
            tradeInput.srcAmount,
            tradeInput.maxDestAmount,
            rateResult);
        if (actualSrcAmount < tradeInput.srcAmount) {
            //if there is "change" send back to trader
            if (tradeInput.src == ETH_TOKEN_ADDRESS) {
                tradeInput.trader.transfer(tradeInput.srcAmount - actualSrcAmount);
            } else {
                tradeInput.src.transfer(tradeInput.trader, (tradeInput.srcAmount - actualSrcAmount));
            }
        }
        // verify trade size is smaller than user cap
        require(weiAmount <= getUserCapInWei(tradeInput.trader));
        //do the trade
        //src to ETH
        require(doReserveTrade(
                tradeInput.src,
                actualSrcAmount,
                ETH_TOKEN_ADDRESS,
                this,
                weiAmount,
                KyberReserveInterface(rateResult.reserve1),
                rateResult.rateSrcToEth,
                true));
        //Eth to dest
        require(doReserveTrade(
                ETH_TOKEN_ADDRESS,
                weiAmount,
                tradeInput.dest,
                tradeInput.destAddress,
                actualDestAmount,
                KyberReserveInterface(rateResult.reserve2),
                rateResult.rateEthToDest,
                true));
        //when src is ether, reserve1 is doing a "fake" trade. (ether to ether) - don't burn.
        //when dest is ether, reserve2 is doing a "fake" trade. (ether to ether) - don't burn.
        if (tradeInput.src != ETH_TOKEN_ADDRESS)
            require(feeBurnerContract.handleFees(weiAmount, rateResult.reserve1, tradeInput.walletId));
        if (tradeInput.dest != ETH_TOKEN_ADDRESS)
            require(feeBurnerContract.handleFees(weiAmount, rateResult.reserve2, tradeInput.walletId));
        KyberTrade(tradeInput.trader, tradeInput.src, actualSrcAmount, tradeInput.destAddress, tradeInput.dest,
            actualDestAmount);
        return actualDestAmount;
    }
}