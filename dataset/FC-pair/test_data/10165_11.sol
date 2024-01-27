contract c10165{
  /**
   * @notice beneficiary can release their tokens after activated
   */
  function activate() external onlyOwner onlyState(State.Ready) {
    require(numLocks == numBeneficiaries); // double check : assert all releases are recorded
    initialBalance = token.balanceOf(this);
    require(initialBalance > 0);
    activeTime = now; // solium-disable-line security/no-block-members
    // set locker as active state
    state = State.Active;
    emit StateChanged(state);
  }
}