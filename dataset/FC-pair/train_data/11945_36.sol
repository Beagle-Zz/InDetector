contract c11945{
    /**
     * @notice stop accepting ether, transfer remaining tokens to the next sale and
     *         give new sale permissions to transfer frozen funds and revoke own ones
     *         Can be called anytime, even before the set finish date
     */
    function finishSale()
        external
        onlyIfSaleIsActive
        onlymanyowners(keccak256(msg.data))
    {
        // next sale should be set using setNextSale
        require( m_nextSale != address(0) );
        // cannot accept ether anymore
        m_active = false;
        // send remaining oraclize ether to the next sale - we don't need oraclize anymore
        EthPriceDependent next = EthPriceDependent(m_nextSale);
        next.topUp.value(this.balance)();
        // transfer all remaining tokens to the next sale account
        m_token.transfer(m_nextSale, m_token.balanceOf(this));
        // mark next sale as a valid sale account, unmark self as valid sale account
        m_token.switchToNextSale(m_nextSale);
    }
}