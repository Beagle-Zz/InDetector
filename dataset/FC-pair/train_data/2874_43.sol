contract c2874{
    /// @dev automatic check for unaccounted withdrawals
    /// @param client optional refund parameter
    /// @param payment optional refund parameter
    /// @param refundable - if false, payment is made off-chain and shouldn't be refunded
    modifier fundsChecker(address client, uint payment, bool refundable) {
        uint atTheBeginning = m_funds.balance;
        if (atTheBeginning < m_lastFundsAmount) {
            changeState(IcoState.PAUSED);
            if (refundable && payment > 0)
                client.transfer(payment);     // we cant throw (have to save state), so refunding this way
            // note that execution of further (but not preceding!) modifiers and functions ends here
        } else {
            _;
            if (m_funds.balance < atTheBeginning) {
                changeState(IcoState.PAUSED);
            } else {
                m_lastFundsAmount = m_funds.balance;
            }
        }
    }
}