contract c2874{
    /// @notice withdraw accumulated balance, called by payee in case crowdsale failed
    /// @dev caller should approve tokens bought during ICO to this contract
    function withdrawPayments()
        external
        nonReentrant
        requiresState(State.REFUNDING)
    {
        address payee = msg.sender;
        uint payment = m_weiBalances[payee];
        uint tokens = m_tokenBalances[payee];
        // check that there is some ether to withdraw
        require(payment != 0);
        // check that the contract holds enough ether
        require(this.balance >= payment);
        // check that the investor (payee) gives back all tokens bought during ICO
        require(m_token.allowance(payee, this) >= m_tokenBalances[payee]);
        totalInvested = totalInvested.sub(payment);
        m_weiBalances[payee] = 0;
        m_tokenBalances[payee] = 0;
        m_token.transferFrom(payee, this, tokens);
        payee.transfer(payment);
        RefundSent(payee, payment);
    }
}