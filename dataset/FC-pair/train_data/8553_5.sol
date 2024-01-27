contract c8553{
  /**
   * Set an upgrade agent that handles
   */
  function setUpgradeAgent(address agent) external {
      // The token is not yet in a state that we could think upgrading
      require(canUpgrade());
      require(agent != 0x0);
      // Only a master can designate the next agent
      require(msg.sender == upgradeMaster);
      // Upgrade has already begun for an agent
      require(getUpgradeState() != UpgradeState.Upgrading);
      upgradeAgent = UpgradeAgent(agent);
      // Bad interface
      require(upgradeAgent.isUpgradeAgent());
      // Make sure that token supplies match in source and target
      require(upgradeAgent.originalSupply() == totalSupply);
      UpgradeAgentSet(upgradeAgent);
  }
}