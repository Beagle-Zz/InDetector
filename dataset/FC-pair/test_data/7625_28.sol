contract c7625{
  /**
   * TODO: add check if _vestingAgent is contract address
   * @dev Allow to change vesting agent.
   * @param _vestingAgent The address of new vesting agent.
   */
  function changeVestingAgent(address _vestingAgent)
    public
    onlyOwner
  {
    address oldVestingAgent = vestingAgent;
    vestingAgent = _vestingAgent;
    emit ChangeVestingAgent(oldVestingAgent, _vestingAgent);
  }
}