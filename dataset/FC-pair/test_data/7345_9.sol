contract c7345{
  // ERC223 Transfer to a contract or externally-owned account
  function transfer( address to, uint value, bytes data ) public
  returns (bool success)
  {
    if (isContract(to)) {
      return transferToContract( to, value, data );
    }
    _transfer( msg.sender, to, value, data );
    return true;
  }
}