contract c40163{
   
  function activateAccount(address addr) internal {
    if (!accountActive[addr]) {
      accountActive[addr] = true;
      accountIndex.push(addr);
    }
  }
}