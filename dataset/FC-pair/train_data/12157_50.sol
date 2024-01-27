contract c12157{
  /**
   * @dev Deposit ether with smart contract to allow refunds
   */
  function depositEtherForRefund() external payable {
    emit EtherDepositedForRefund(msg.sender, msg.value);
  }
}