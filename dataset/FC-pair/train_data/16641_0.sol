contract c16641{
  /** @dev Reverts if not in crowdsale time range. */
  modifier onlyWhilePreSaleOpen {
    require(now >= presaleopeningTime && now <= presaleclosingTime, "Pre Sale Close");
    _;
  }
}