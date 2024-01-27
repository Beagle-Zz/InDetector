contract c8167{
  // Tarot by donation
  function withdraw() public {
    require(msg.sender == creator);
    creator.transfer(address(this).balance);
  }
}