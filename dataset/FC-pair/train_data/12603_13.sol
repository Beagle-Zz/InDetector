contract c12603{
  // getter to retrieve divident owed
  function getOwedDividend(address _owner) public view returns (uint256 total, uint256[]) {
    uint256[] memory noDividends = new uint256[](0);
    // And the address' current balance
    uint256 balance = BasicToken.balanceOf(_owner);
    // retrieve index of last dividend this address received
    // NOTE: the default return value of a mapping is 0 in this case
    uint idx = lastDividend[_owner];
    if (idx == dividendSnapshots.length) return (total, noDividends);
    if (balance == 0 && team[_owner] != true) return (total, noDividends);
    uint256[] memory dividends = new uint256[](dividendSnapshots.length - idx - i);
    uint256 currBalance = balance;
    for (uint i = idx; i < dividendSnapshots.length; i++) {
      // We should be able to remove the .mul(tokenPrecision) and .div(tokenPrecision) and apply them once
      // at the beginning and once at the end, but we need to math it out
      uint256 dividend = currBalance.mul(tokenPrecision).div(dividendSnapshots[i].totalSupply).mul(dividendSnapshots[i].dividendsIssued).div(tokenPrecision);
      // Add the management dividends in equal parts if the current address is part of the team
      if (team[_owner] == true) {
        dividend = dividend.add(dividendSnapshots[i].managementDividends.div(teamNum));
      }
      total = total.add(dividend);
      dividends[i - idx] = dividend;
      currBalance = currBalance.add(dividend);
    }
    return (total, dividends);
  }
}