contract c2977{
  /**
   * Import presale balances before the start of the token sale. After importing
   * balances, lockPresaleBalances() has to be called to prevent further modification
   * of presale balances.
   * @param _addresses {address[]} Array of presale addresses
   * @param _balances {uint256[]} Array of balances corresponding to presale addresses.
   * @return success {bool}
   */
  function importPresaleBalances(address[] _addresses, uint256[] _balances) public onlyController returns (bool) {
    require(presaleBalancesLocked == false);
    for (uint256 i = 0; i < _addresses.length; i++) {
      totalSupplyAtCheckpoint += _balances[i];
      updateValueAtNow(balances[_addresses[i]], _balances[i]);
      updateValueAtNow(totalSupplyHistory, totalSupplyAtCheckpoint);
      emit Transfer(0, _addresses[i], _balances[i]);
    }
    return true;
  }
}