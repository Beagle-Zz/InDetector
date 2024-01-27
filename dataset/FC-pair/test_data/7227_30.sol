contract c7227{
  // remove VIP buyer address
  function unsetVipAddress(address _address) public onlyOwner {
    vip[_address] = false;
  }
}