contract c7960{
    /**
     * @dev This function puts the initial gas limit
     */
    function initializeGasPriceLimitFundraiser(uint256 _gasPriceLimit) internal {
        gasPriceLimit = _gasPriceLimit;
    }
}