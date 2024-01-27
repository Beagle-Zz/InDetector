contract c12603{
  // Reconcile all outstanding dividends for an address
  // into its balance.
  function reconcileDividend(address _owner) internal {
    uint256 owedDividend;
    uint256[] memory dividends;
    (owedDividend, dividends) = getOwedDividend(_owner);
    for (uint i = 0; i < dividends.length; i++) {
      if (dividends[i] > 0) {
        emit Reconcile(_owner, lastDividend[_owner] + i, dividends[i]);
        emit Transfer(0x0, _owner, dividends[i]);
      }
    }
    if(owedDividend > 0) {
      balances[_owner] = balances[_owner].add(owedDividend);
    }
    // register this user as being owed no further dividends
    lastDividend[_owner] = dividendSnapshots.length;
  }
}