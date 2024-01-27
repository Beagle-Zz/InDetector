contract c18300{
  /**
   * @dev Set the crowdsale Agent
   * @param _crowdsaleAgent crowdsale contract address
   */
  function setCrowdsaleAgent(address _crowdsaleAgent) public onlyOwner {
    crowdsaleAgent = _crowdsaleAgent;
  }
}