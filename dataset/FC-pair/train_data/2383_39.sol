contract c2383{
    /**
     * @dev get the current bonus-rate for the current SaleState
     * @return the current rate as a percentage (e.g. 140 = 140% bonus)
     */
    function getCurrentTierRatePercentage() public view returns (uint256) {
        return tierConfigs[keccak256(state)].tierRatePercentage;
    }
}