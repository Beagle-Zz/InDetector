contract c40600{
   
  modifier manager() {
    if (msg.sender == currentManager) _;
  }
}