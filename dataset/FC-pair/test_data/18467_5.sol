contract c18467{
  // Internal function for handling eth refunds during stage three.
  function _ethRefund () internal {
    assert (contractStage == 3);
    require (msg.sender == owner || msg.sender == receiverAddress);
    require (msg.value >= contributionMin);
    ethRefundAmount.push(msg.value);
    EthRefundReceived(msg.sender, msg.value);
  }
}