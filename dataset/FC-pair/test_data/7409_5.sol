contract c7409{
  /**
   * Set an upgrade agent that handles
   */
  function setUpgradeAgent(address agent) external {
      if(!canUpgrade()) {
        // The token is not yet in a state that we could think upgrading
        throw;
      }
      if (agent == 0x0) throw;
      // Only a master can designate the next agent
      if (msg.sender != upgradeMaster) throw;
      // Upgrade has already begun for an agent
      if (getUpgradeState() == UpgradeState.Upgrading) throw;
      upgradeAgent = UpgradeAgent(agent);
      // Bad interface
      if(!upgradeAgent.isUpgradeAgent()) throw;
      // Make sure that token supplies match in source and target
      if (upgradeAgent.originalSupply() != totalSupply) throw;
      UpgradeAgentSet(upgradeAgent);
  }
}