contract c2874{
    /// @dev Check that price update was requested
    ///      more than 1 update interval ago
    ///      NOTE: m_leeway seconds added to offset possible timestamp inaccuracy
    function updateRequestExpired() public view returns (bool) {
        return ( (getTime() + m_leeway) >= (m_ETHPriceLastUpdateRequest + m_ETHPriceUpdateInterval) );
    }
}