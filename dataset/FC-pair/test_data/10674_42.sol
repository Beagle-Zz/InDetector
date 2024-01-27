contract c10674{
  /**
  * @dev Function to dismiss the upgrade capability
  * @return True if the operation was successful.
  */
  function finishUpgrade() onlyUpgradeManager public returns (bool) {
    isUpgradeFinished_ = true;
    emit FinishUpgrade();
    return true;
  }
}