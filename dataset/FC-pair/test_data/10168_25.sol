contract c10168{
  /* External */
  /**
    * @notice After crowdsale finalized, mint additional tokens for ESC-LOCK.
    *         This generation only happens once.
    */
  function mintAfterSale() external onlyOwner returns (bool) {
    require(!tokenGenerated);
    // valid only after finishMinting is executed
    require(mintingFinished);
    // revert if total supply is more than TARGET_TOTAL_SUPPLY
    uint256 preSupply = totalSupply();
    require(preSupply < TARGET_TOTAL_SUPPLY);
    uint256 amount = TARGET_TOTAL_SUPPLY.sub(preSupply);
    // mint token internally
    totalSupply_ = TARGET_TOTAL_SUPPLY;
    balances[owner] = balances[owner].add(amount);
    emit Transfer(address(0), owner, amount);
    tokenGenerated = true;
    emit MintAfterSale(owner, preSupply, totalSupply());
    return true;
  }
}