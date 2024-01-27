contract c7060{
  /// @dev Calculates the affiliate amount for a specific amount. Only owner.
  function getAffiliateAmount(uint amount) public view returns(uint)  {
    return SafeMath.safeMul(amount, affiliatePercentage) / (1 ether);
  }
}