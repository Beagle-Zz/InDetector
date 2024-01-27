contract c2874{
    /// @dev set addresses for ether and token storage
    ///      performed once by deployer
    /// @param _funds FundsRegistry address
    /// @param _tokenDistributor address to send remaining tokens to after ICO
    /// @param _previouslySold how much sold in previous sales in cents
    function init(address _funds, address _tokenDistributor, uint _previouslySold)
        external
        validAddress(_funds)
        validAddress(_tokenDistributor)
        onlymanyowners(keccak256(msg.data))
    {
        // can be set only once
        require(m_funds == address(0));
        m_funds = FundsRegistry(_funds);
        // calculate remaining tokens and leave 25% for manual allocation
        c_maximumTokensSold = m_token.balanceOf(this).sub( m_token.totalSupply().div(4) );
        // manually set how much should be sold taking into account previously collected
        if (_previouslySold < c_softCapUsd)
            c_softCapUsd = c_softCapUsd.sub(_previouslySold);
        else
            c_softCapUsd = 0;
        // set account that allocates the rest of tokens after ico succeeds
        m_tokenDistributor = _tokenDistributor;
    }
}