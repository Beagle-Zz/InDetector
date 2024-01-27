contract c7046{
  /**
     * @dev Must be called after crowdsale ends, to do some extra finalization
     * work. Calls the contract's finalization function.
     */
  function finalize() public onlyOwner {
    require(!isFinalized);
    vesting = new GambioVesting(vestingPeriod, vestingBeneficiary, now, 0, vestingDuration, false);
    token.mint(address(vesting), vestingTokens);
    emit Finalized();
    isFinalized = true;
  }
}