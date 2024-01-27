contract c18118{
    /**
     * Reward is based on the amount held, relative to total supply of tokens.
     */
    function calculateReward(uint256 v) constant returns (uint256) {
        uint256 reward = 0;
        if (feePot > 0) {
            reward = feePot * v / totalSupply; // assuming that if feePot > 0 then also totalSupply > 0
        }
        return reward;
    }
}