contract c40164{
   
  function relayReceiveApproval(address _caller, address _spender, uint256 _amount, bytes _extraData) returns (bool success) {
     assert(msg.sender == backendContract);
     TokenRecipient spender = TokenRecipient(_spender);
     spender.receiveApproval(_caller, _amount, this, _extraData);
     return true;
  }
}