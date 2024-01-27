contract c16883{
  /**
   * @dev Function to mint tokens. We mint as we sell tokens (actually the PentacoreCrowdsale contract does).
   * @dev The recipient should be whitelisted.
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) public onlyBy(crowdsale) isWhitelisted(_to) returns (bool) {
    // Should run even when the token is paused.
    require(tokenNAVMicroUSD != uint256(0));
    require(weiPerUSD != uint256(0));
    require(totalSupply_.add(_amount) <= tokenCap);
    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount);
    return true;
  }
}