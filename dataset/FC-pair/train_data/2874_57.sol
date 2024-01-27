contract c2874{
    /// @notice send everything to the new (fixed) ico smart contract
    /// @param newICO address of the new smart contract
    function applyHotFix(address newICO)
        public
        validAddress(newICO)
        requiresState(IcoState.PAUSED)
        onlymanyowners(keccak256(msg.data))
    {
        EthPriceDependent next = EthPriceDependent(newICO);
        next.topUp.value(this.balance)();
        m_token.transfer(newICO, m_token.balanceOf(this));
    }
}