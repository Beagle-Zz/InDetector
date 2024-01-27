contract c7803{
    //Withdraw tokens only after lock-up ends, applying the staged lock-up scheme.
    function withdrawTokens() public {
      uint256 tobeReleased = 0;
      uint256 unreleased = releasableAmount();
      //max amount to be withdrawn is the releasable amount, excess stays in lock-up, unless all lock-ups have ended
      if(balances[msg.sender] >= unreleased && lockupEndTime[lockupEndTime.length-1] > now)
      {
        tobeReleased = unreleased;
      }
      else
      {
        tobeReleased = balances[msg.sender];
      }
      //revert transaction when nothing to be withdrawn
      require(tobeReleased > 0);
      balances[msg.sender] = balances[msg.sender].sub(tobeReleased);
      tokensStillInLockup = tokensStillInLockup.sub(tobeReleased);
      released[msg.sender] = released[msg.sender].add(tobeReleased);
      _deliverTokens(msg.sender, tobeReleased);
    }
}