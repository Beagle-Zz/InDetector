contract c10674{
  /**
   * @dev Allows the upgrade the M5 logic contract 
   * @param newM5Logic The address of the new contract
   */
  function upgradeM5Logic(address newM5Logic) public onlyUpgradeManager { // solium-disable-line
    require(newM5Logic != address(0));
    emit M5LogicUpgrade(M5Logic_, newM5Logic);
    M5Logic_ = newM5Logic;
  }
}