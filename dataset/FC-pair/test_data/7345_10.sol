contract c7345{
  // ERC223 Transfer to contract and invoke tokenFallback() method
  function transferToContract( address to, uint value, bytes data ) private
  returns (bool success)
  {
    _transfer( msg.sender, to, value, data );
    ContractReceiver rx = ContractReceiver(to);
    rx.tokenFallback( msg.sender, value, data );
    return true;
  }
}