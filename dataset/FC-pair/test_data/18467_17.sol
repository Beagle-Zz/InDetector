contract c18467{
  // This is a standard function required for ERC223 compatibility.
  function tokenFallback (address from, uint value, bytes data) public {
    ERC223Received(from, value);
  }
}