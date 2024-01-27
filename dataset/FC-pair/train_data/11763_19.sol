contract c11763{
  /**
   * Allow the token holder to upgrade some of their tokens to a new contract.
   */
  function upgrade(uint256 value) public {
      UpgradeState state = getUpgradeState();
      if(!(state == UpgradeState.ReadyToUpgrade || state == UpgradeState.Upgrading)) {
        // Called in a bad state
        throw;
      }
      // Validate input value.
      if (value == 0) throw;
      balances[msg.sender] = balances[msg.sender].sub(value);
      // Take tokens out from circulation
      totalSupply_ = totalSupply_.sub(value);
      totalUpgraded = totalUpgraded.add(value);
      // Upgrade agent reissues the tokens
      upgradeAgent.upgradeFrom(msg.sender, value);
      Upgrade(msg.sender, upgradeAgent, value);
  }
}