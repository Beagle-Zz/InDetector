contract c8553{
  /**
   * Allow the token holder to upgrade some of their tokens to a new contract.
   */
  function upgrade(uint256 value) public {
      UpgradeState state = getUpgradeState();
      require(state == UpgradeState.ReadyToUpgrade || state == UpgradeState.Upgrading);
      // Validate input value.
      require(value != 0);
      balances[msg.sender] = safeSub(balances[msg.sender], value);
      // Take tokens out from circulation
      totalSupply = safeSub(totalSupply, value);
      totalUpgraded = safeAdd(totalUpgraded, value);
      // Upgrade agent reissues the tokens
      upgradeAgent.upgradeFrom(msg.sender, value);
      Upgrade(msg.sender, upgradeAgent, value);
  }
}