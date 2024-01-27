contract c4721{
    /**
    * @dev Update the current rate based on the scheme
    * 1st of Sep - 30rd of Sep -> 30% Bonus
    * 1st of Oct - 31st of Oct -> 20% Bonus
    * 1st of Nov - 30rd of Oct -> 10% Bonus
    * 1st of Dec - 31st of Dec -> 0% Bonus
    */
    function updateRate() external onlyOwner {
        uint256 i = stages.length;
        while (i-- > 0) {
            if (block.timestamp >= stages[i]) {
                rate = initialRate.add(initialRate.mul(bonuses[i]).div(100));
                emit CurrentRateChange(rate);
                break;
            }
        }
    }
}