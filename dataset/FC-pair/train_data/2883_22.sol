contract c2883{
    /// @notice set the limit of ETH in cents, oraclize data smaller than this is not accepted
    /// @param _price Price in US cents
    function setETHPriceLowerBound(uint _price)
        external
        onlymanyowners(keccak256(msg.data))
    {
        m_ETHPriceLowerBound = _price;
    }
}