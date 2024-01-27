contract c12321{
  /**
  * @dev Simple getter to retrieve talent agent
  * @param freelance talent address
  * @return address of the agent
  **/
  function getFreelanceAgent(address freelance)
      public
      view
      returns (address)
  {
      return data[freelance].appointedAgent;
  }
}