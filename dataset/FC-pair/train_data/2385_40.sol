contract c2385{
    /**
     * @dev Get the current hardCap for the current SaleState
     * @return The current hardCap
     */
    function getCurrentTierHardcap() public view returns (uint256) {
        return tierConfigs[keccak256(state)].hardCap;
    }
}