contract c2874{
    /// @dev common buy for ether and non-ether
    /// @param client who invests
    /// @param payment how much ether
    /// @param refundable true if invested in ether - using buy()
    function internalBuy(address client, uint payment, bool refundable)
        internal
        nonReentrant
        timedStateChange(client, payment, refundable)
        fundsChecker(client, payment, refundable)
    {
        // don't allow to buy anything if price change was too long ago
        // effectively enforcing a sale pause
        require( !priceExpired() );
        require(m_state == IcoState.ACTIVE || m_state == IcoState.INIT && isOwner(client) /* for final test */);
        require((payment.mul(m_ETHPriceInCents)).div(1 ether) >= c_MinInvestmentInCents);
        uint actualPayment = payment;
        uint amount;
        (amount, actualPayment) = estimateTokensWithActualPayment(payment);
        // change ICO investment stats
        m_currentUsdAccepted = m_currentUsdAccepted.add( actualPayment.mul(m_ETHPriceInCents).div(1 ether) );
        m_currentTokensSold = m_currentTokensSold.add( amount );
        // send bought tokens to the client
        m_token.transfer(client, amount);
        assert(m_currentTokensSold <= c_maximumTokensSold);
        if (refundable) {
            // record payment if paid in ether
            m_funds.invested.value(actualPayment)(client, amount);
            FundTransfer(client, actualPayment, true);
        }
        // check if ICO must be closed early
        if (payment.sub(actualPayment) > 0) {
            assert(c_maximumTokensSold == m_currentTokensSold);
            finishICO();
            // send change
            client.transfer(payment.sub(actualPayment));
        } else if (c_maximumTokensSold == m_currentTokensSold) {
            finishICO();
        }
    }
}