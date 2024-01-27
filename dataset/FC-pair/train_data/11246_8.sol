contract c11246{
  /**
   * @notice transfer releasable tokens for beneficiary wrt the release graph
   */
  function release() external onlyState(State.Active) onlyBeneficiary(msg.sender) {
    require(!beneficiaries[msg.sender].releaseAllTokens);
    uint releasableAmount = getReleasableAmount(msg.sender);
    beneficiaries[msg.sender].withdrawAmount = beneficiaries[msg.sender].withdrawAmount.add(releasableAmount);
    beneficiaries[msg.sender].releaseAllTokens = beneficiaries[msg.sender].withdrawAmount == getPartialAmount(
      beneficiaries[msg.sender].ratio,
      coeff,
      initialBalance);
    withdrawAmount = withdrawAmount.add(releasableAmount);
    if (withdrawAmount == initialBalance) {
      state = State.Drawn;
      emit StateChanged(state);
    }
    token.transfer(msg.sender, releasableAmount);
    emit Released(msg.sender, releasableAmount);
  }
}