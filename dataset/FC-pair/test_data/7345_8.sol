contract c7345{
  // ERC223 Transfer and invoke specified callback
  function transfer( address to,
                     uint value,
                     bytes data,
                     string custom_fallback ) public returns (bool success)
  {
    _transfer( msg.sender, to, value, data );
    if ( isContract(to) )
    {
      ContractReceiver rx = ContractReceiver( to );
      require( address(rx).call.value(0)(bytes4(keccak256(custom_fallback)),
               msg.sender,
               value,
               data) );
    }
    return true;
  }
}