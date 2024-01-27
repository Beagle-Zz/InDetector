contract c40597{
   
  modifier manager() {
    if (msg.sender == currentManager) _;
  }
}