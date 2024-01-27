contract c2874{
    /// @notice set the price of ETH in cents, called in case we don't get oraclize data
    ///         for more than double the update interval
    /// @param _price Price in US cents
    function setETHPriceManually(uint _price)
        external
        onlymanyowners(keccak256(msg.data))
    {
        // allow for owners to change the price anytime if update is not running
        // but if it is, then only in case the price has expired
        require( priceExpired() || updateRequestExpired() );
        m_ETHPriceInCents = _price;
        m_ETHPriceLastUpdate = getTime();
        NewETHPrice(m_ETHPriceInCents);
    }
}