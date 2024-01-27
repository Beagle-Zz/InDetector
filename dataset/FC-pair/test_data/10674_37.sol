contract c10674{
  /**
  * @dev get the upgrade status
  * @return the upgrade status. if true, no more upgrades are possible.
  */
  function isUpgradeFinished() public view returns (bool) {
    return isUpgradeFinished_;
  }
}