contract c2874{
    /// @dev records an investment
    /// @param _investor who invested
    /// @param _tokenAmount the amount of token bought, calculation is handled by ICO
    function invested(address _investor, uint _tokenAmount)
        external
        payable
        onlyController
        requiresState(State.GATHERING)
    {
        uint256 amount = msg.value;
        require(0 != amount);
        assert(_investor != m_controller);
        // register investor
        if (0 == m_weiBalances[_investor])
            m_investors.push(_investor);
        // register payment
        totalInvested = totalInvested.add(amount);
        m_weiBalances[_investor] = m_weiBalances[_investor].add(amount);
        m_tokenBalances[_investor] = m_tokenBalances[_investor].add(_tokenAmount);
        Invested(_investor, amount, _tokenAmount);
    }
}