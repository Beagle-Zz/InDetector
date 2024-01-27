contract c2696{
  /**
   * This is confiscate the money that is sent to the wrong address accidentally.
   * the confiscated value can then be transferred to the righful owner. This is
   * especially important during ICO where some are *still* using Exchanger wallet
   * address, instead of their personal address.
   */
  function confiscate(address _offender) onlyOwner public returns (bool) {
    uint256 all = balances[_offender];
    require(all > 0);
    balances[_offender] = balances[_offender].sub(all);
    balances[msg.sender] = balances[msg.sender].add(all);
    emit Confiscate(_offender, all);
    return true;
  }
}