contract c7227{
  // update address where funds are collected
  function setWalletAddress(address _wallet) public onlyOwner {
    require(!isFinalized);
    wallet = _wallet;
  }
}