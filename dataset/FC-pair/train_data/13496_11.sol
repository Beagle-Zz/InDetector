contract c13496{
  /**
   * Set an upgrade agent that handles
   */
  function setUpgradeAgent(address agent) external {
      if(!canUpgrade()) {
        // The token is not yet in a state that we could think upgrading
        revert();
      }
      if (agent == 0x0) revert();
      // Only a master can designate the next agent
      if (msg.sender != upgradeMaster) revert();
      // Upgrade has already begun for an agent
      if (getUpgradeState() == UpgradeState.Upgrading) revert();
      upgradeAgent = UpgradeAgent(agent);
      // Bad interface
      if(!upgradeAgent.isUpgradeAgent()) revert();
      // Make sure that token supplies match in source and target
      if (upgradeAgent.originalSupply() != totalSupply) revert();
      UpgradeAgentSet(upgradeAgent);
  }
}