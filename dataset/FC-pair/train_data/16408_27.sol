contract c16408{
    /**
     * @dev calculate WEI refund to investor, if any. This handles rounding errors
     * which are important here due to the 0 decimals
     * @param weiReceived uint256 wei received from the investor
     * @param tokenAmount uint256 CAK tokens minted for investor
     */
    function refundLeftOverWei(uint256 weiReceived, uint256 tokenAmount) internal view returns (uint256) {
        uint256 refundAmount = 0;
        uint256 weiInvested = tokenAmount.mul(rate);
        if (weiInvested < weiReceived)
            refundAmount = weiReceived.sub(weiInvested);
        return refundAmount;
    }
}