contract c16992{
  /* Calculate locked token reward percentage，Actual value: rewardFactor/1000 */
    function _calcLockRewardPercentage() internal returns (uint factor){
        uint phase = NUM_OF_PHASE * (now - lockStartTime)/( lockDeadline - lockStartTime);
        if (phase  >= NUM_OF_PHASE) {
            phase = NUM_OF_PHASE - 1;
        }
        lockRewardFactor = lockRewardsPercentages[phase];
        return lockRewardFactor;
    }
}