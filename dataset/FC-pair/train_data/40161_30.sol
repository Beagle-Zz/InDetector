contract c40161{
   
  function activateAccount(address addr) internal {
    if (!accountActive[addr]) {
      accountActive[addr] = true;
      accountIndex.push(addr);
    }
  }
}