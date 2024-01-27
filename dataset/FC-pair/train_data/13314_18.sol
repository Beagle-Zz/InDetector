contract c13314{
  /* Calculate the unlockable balance */
  function _releasableAmount(address _owner, uint256 time) internal view returns (uint256){
    lockInfo storage userLockInfo = _lockInfo[_owner]; 
    if (userLockInfo.transfered == userLockInfo.amount){
      return 0;
    }
    // Unlockable tokens per cycle.
    uint256 amountPerRelease = userLockInfo.amount.div(userLockInfo.releaseCount); //amount/cnt
    // Total unlockable balance.
    uint256 amount = amountPerRelease.mul((time.sub(userLockInfo.start)).div(userLockInfo.duration));
    if (amount > userLockInfo.amount){
      amount = userLockInfo.amount;
    }
    // 
    amount = amount.sub(userLockInfo.transfered);
    return amount;
  }
}