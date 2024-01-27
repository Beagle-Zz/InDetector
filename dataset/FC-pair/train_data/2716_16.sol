contract c2716{
    /// @dev returns how much Scale a user has earned so far
    /// @param _now is passed in to allow for a gas-free analysis
    /// @return staking gains based on the amount of time passed since staking began
    function getStakingGains(uint _now) view public returns (uint) {
        if (stakeBalances[msg.sender].stakeBalance == 0) {
          return 0;
        }
        return calculateStakeGains(_now);
    }
}