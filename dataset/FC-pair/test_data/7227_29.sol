contract c7227{
  // add VIP buyer address
  function setVipAddress(address _address) public onlyOwner {
    vip[_address] = true;
  }
}