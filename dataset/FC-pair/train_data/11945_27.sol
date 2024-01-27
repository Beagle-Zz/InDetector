contract c11945{
    /// @dev Check that double the update interval has passed
    ///      since last successful price update
    function priceExpired() public view returns (bool) {
        return (getTime() > m_ETHPriceLastUpdate + 2 * m_ETHPriceUpdateInterval);
    }
}