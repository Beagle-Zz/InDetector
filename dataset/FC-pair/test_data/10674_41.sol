contract c10674{
  /**
   * @dev Allows the upgrade the M5 logic contract and token at the same transaction
   * @param newM5Token The address of a new M5 token
   * @param newM5Logic The address of the new contract
   */
  function upgradeM5(address newM5Token, address newM5Logic) public onlyUpgradeManager { // solium-disable-line
    require(newM5Token != address(0));
    require(newM5Logic != address(0));
    emit M5TokenUpgrade(M5Token_, newM5Token);
    emit M5LogicUpgrade(M5Logic_, newM5Logic);
    M5Token_ = newM5Token;
    M5Logic_ = newM5Logic;
  }
}