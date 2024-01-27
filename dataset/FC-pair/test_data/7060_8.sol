contract c7060{
  /// @dev Collects fees according to last payment receivedi. Only valid smart contracts.
  function collect(
    address _affiliate) public payable onlyMembers
  {
    if(_affiliate == address(0))
      pendingWithdrawals[serviceAccount] += msg.value;
    else {
      uint affiliateAmount = getAffiliateAmount(msg.value);
      pendingWithdrawals[_affiliate] += affiliateAmount;
      pendingWithdrawals[serviceAccount] += SafeMath.safeSub(msg.value, affiliateAmount);
    }
  }
}