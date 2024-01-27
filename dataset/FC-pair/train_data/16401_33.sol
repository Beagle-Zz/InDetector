contract c16401{
  // these events can be turned on to make up for Solidity's horrifying logging situation
  // event logUint(address add, string text, uint256 value);
  // event simpleLogUint(string text, uint256 value);
  // Send a PullPayment.
  function pay(uint256 _deedId)
  external nonReentrant payable {
    address factTeam = factTeamOf(_deedId);
    asyncSend(factTeam, msg.value);
    emit Payment(_deedId, msg.sender, factTeam, msg.value);
  }
}