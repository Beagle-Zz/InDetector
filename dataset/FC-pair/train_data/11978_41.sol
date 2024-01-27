contract c11978{
    // Calculates the amount that has already vested.
    function vestedAmount() private view returns (uint256) {
      uint256 lockupStage = 0;
      uint256 releasable = 0;
      //determine current lock-up phase
      uint256 i=0;
      while (i < lockupEndTime.length && lockupEndTime[i]<=now)
      {
        lockupStage = lockupStage.add(1);
        i = i.add(1);
      }
      //if lockupStage == 0 then all tokens are still in lock-up (first lock-up period not ended yet)
      if(lockupStage>0)
      {
        //calculate the releasable amount depending on the current lock-up stage
        releasable = (lockupStage.sub(1).mul(stagedVestedLockUpAmounts)).add(firstVestedLockUpAmount);
      }
      return releasable;
    }
}