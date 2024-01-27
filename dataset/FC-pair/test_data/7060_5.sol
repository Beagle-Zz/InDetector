contract c7060{
  /// @dev Set the affiliate percentage. Only owner.
  function changeAffiliatePercentage(uint _affiliatePercentage) public onlyOwner {
    affiliatePercentage = _affiliatePercentage;
  }
}