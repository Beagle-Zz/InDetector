contract c9377{
    /**
     * @dev Calculates the amount that has already vested.
     * @param beneficiary The address that will receive the vested tokens.
     */
    function vestedAmount(address beneficiary) public view returns (uint256) {
        uint256 vested = 0;
        if (block.timestamp >= cliff && block.timestamp < end) {
            // after cliff -> 1/21 of totalBalance every month, must skip first 3 months
            uint256 totalBalance = investments[beneficiary].totalBalance;
            uint256 monthlyBalance = totalBalance.div(VESTING_DIV_RATE);
            uint256 time = block.timestamp.sub(cliff);
            uint256 elapsedOffsets = time.div(VESTING_INTERVAL);
            uint256 vestedToSum = elapsedOffsets.mul(monthlyBalance);
            vested = vested.add(vestedToSum);
        }
        if (block.timestamp >= end) {
            // after end -> all vested
            vested = investments[beneficiary].totalBalance;
        }
        return vested;
    }
}