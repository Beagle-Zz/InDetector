contract c13056{
  /**
   * @notice Transfers tokens held by timelock to beneficiary.
   */
  function release(uint256 _amount) public {
    uint256 balance = token.balanceOf(address(this));
    require(balance > 0);
    if(!withdrawalsInitiated){
        // unlock 50% of existing balance
        unlocked = balance.div(2);
        withdrawalsInitiated = true;
    }
    if(now >= releaseTime){
        unlocked = balance;
    }
    require(_amount <= unlocked);
    unlocked = unlocked.sub(_amount);
    token.safeTransfer(beneficiary, _amount);
  }
}