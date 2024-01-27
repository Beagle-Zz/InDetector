contract c7012{
    /// @dev Override to use cumulative rates to calculated amount for vesting.
    function vestedAmount(ERC20Basic token) public view returns (uint256) {
        if (now < start) {
            return 0;
        }
        uint256 currentBalance = token.balanceOf(this);
        uint256 totalBalance = currentBalance.add(released[token]);
        uint256 timeSinceStart = now.sub(start);
        uint256 currentPeriod = timeSinceStart.div(interval);
        if (currentPeriod >= cumulativeRates.length) {
            return totalBalance;
        }
        return totalBalance.mul(cumulativeRates[currentPeriod]).div(100);
    }
}