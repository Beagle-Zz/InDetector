contract c18819{
  /**
   * Set an upgrade agent that handles the upgrade process
   */
  function setUpgradeAgent(address agent) onlyMaster external {
    // Check whether the token is in a state that we could think of upgrading
    require(canUpgrade());
    require(agent != 0x0);
    // Upgrade has already begun for an agent
    require(getUpgradeState() != UpgradeState.Upgrading);
    upgradeAgent = UpgradeAgent(agent);
    // Bad interface
    require(upgradeAgent.isUpgradeAgent());
    // Make sure that token supplies match in source and target
    require(upgradeAgent.originalSupply() == totalSupply());
    UpgradeAgentSet(upgradeAgent);
  }
}