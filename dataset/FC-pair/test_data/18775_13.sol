contract c18775{
  /**
   * @dev Function to mint tokens
   * @param _to The address that will recieve the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @param _releaseTime The (optional) freeze time - KYC & bounty accounts.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount, uint256 _releaseTime) internal canMint returns (bool) {
    totalSupply = totalSupply.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    if ( _releaseTime > 0 ) {
        releaseTime[_to] = _releaseTime;
    }
    emit Transfer(0x0, _to, _amount);
    return true;
  }
}