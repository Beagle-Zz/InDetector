contract c11008{
  /**
   * @dev Creates Policy, transfers ownership to msg.sender, registers address for all parties involved,
   * and transfers IXT 
   */
  function createContract(string _clientInfo, address _brokerEtherAddress, address _clientEtherAddress, string _enquiryId) public isNotPaused {
    Policy policy = new Policy(_clientInfo, _brokerEtherAddress, _clientEtherAddress, _enquiryId);
    policy.changeOwner(msg.sender);
    policiesByParticipant[_brokerEtherAddress].push(policy);
    if (_clientEtherAddress != _brokerEtherAddress) {
      policiesByParticipant[_clientEtherAddress].push(policy);
    }
    if (msg.sender != _clientEtherAddress && msg.sender != _brokerEtherAddress) {
      policiesByParticipant[msg.sender].push(policy);
    }
    policies.push(policy);
    IXTPayment.transferIXT(_clientEtherAddress, owner, "create_insurance");
    emit PolicyCreated(policy, msg.sender);
  }
}