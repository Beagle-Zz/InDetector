contract c40182{
   
  function freezeAccount(address addr, bool freeze) multisig(sha3(msg.data)) {
    frozenAccount[addr] = freeze;
    activateAccount(addr);
  }
}