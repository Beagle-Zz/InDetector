contract c18819{
  /**
   * Allow the token holder to upgrade some of their tokens to a new contract.
   */
  function upgrade(uint value) public {
    UpgradeState state = getUpgradeState();
    // Ensure it's not called in a bad state
    require(state == UpgradeState.ReadyToUpgrade || state == UpgradeState.Upgrading);
    // Validate input value.
    require(value != 0);
    // Upgrade agent reissues the tokens
    upgradeAgent.upgradeFrom(msg.sender, value);
    // Take tokens out from circulation
    burnTokens(msg.sender, value);
    totalUpgraded = totalUpgraded.add(value);
    Upgrade(msg.sender, upgradeAgent, value);
  }
}