contract c7227{
  // release the 1st year locked token
  function Y1_release() onlyOwner public {
    require(Y1_lockedTokenAmount > 0);
    require(now > Y1_lockedTokenReleaseTime);
    // transfer the locked token to restricted
    token.transfer(restricted, Y1_lockedTokenAmount);
    Y1_lockedTokenAmount = 0;
  }
}