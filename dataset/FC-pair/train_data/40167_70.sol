contract c40167{
   
  modifier onlyHotWallet() {
    assert(msg.sender == hotWalletAddress);
    _;
  }
}