contract c8911{
    /*
     * INTERNAL FUNCTIONS
     */
    /// @dev Compute the amount of LRC token that can be purchased.
    /// @param ethAmount Amount of Ether to purchase LRC.
    /// @return Amount of LRC token to purchase
    function computeTokenAmount(uint ethAmount) internal constant returns (uint tokens) {
        uint phase = (block.number - firstblock).div(BLOCKS_PER_PHASE);
        // A safe check
        if (phase >= bonusPercentages.length) {
            phase = bonusPercentages.length - 1;
        }
        uint tokenBase = ethAmount.mul(BASE_RATE);
        uint tokenBonus = tokenBase.mul(bonusPercentages[phase]).div(100);
        tokens = tokenBase.add(tokenBonus);
    }
}