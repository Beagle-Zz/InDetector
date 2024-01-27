contract c7227{
  // release the 2nd year locked token
  function Y2_release() onlyOwner public {
    require(Y1_lockedTokenAmount == 0);
    require(Y2_lockedTokenAmount > 0);
    require(now > Y2_lockedTokenReleaseTime);
    uint256 amount = token.balanceOf(this);
    require(amount > 0);
    // transfer the locked token to restricted
    token.transfer(restricted, amount);
    Y2_lockedTokenAmount = 0;
  }
}