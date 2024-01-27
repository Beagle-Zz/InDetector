contract c2874{
    /// @dev triggers some state changes based on current time
    /// @param client optional refund parameter
    /// @param payment optional refund parameter
    /// @param refundable - if false, payment is made off-chain and shouldn't be refunded
    /// note: function body could be skipped!
    modifier timedStateChange(address client, uint payment, bool refundable) {
        if (IcoState.INIT == m_state && getTime() >= getStartTime())
            changeState(IcoState.ACTIVE);
        if (IcoState.ACTIVE == m_state && getTime() >= getFinishTime()) {
            finishICO();
            if (refundable && payment > 0)
                client.transfer(payment);
            // note that execution of further (but not preceding!) modifiers and functions ends here
        } else {
            _;
        }
    }
}