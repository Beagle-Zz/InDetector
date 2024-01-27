contract c2229{
  /*
    get the releasable tokens
    @return amount of released tokens
  */
  function release() public onlyPayloadSize(0 * 32) returns (uint256) {
    uint256 unreleased = releasableAmount(msg.sender);
    Vesting storage vesting = vestingMap[msg.sender];
    if (unreleased > 0) {
      vesting.released = vesting.released.add(unreleased);
      emit Release(msg.sender, unreleased);
      balances[msg.sender] = balances[msg.sender].add(unreleased);
      emit Transfer(0x0, msg.sender, unreleased);
    }
    return unreleased;
  }
}