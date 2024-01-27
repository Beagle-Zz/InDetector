contract c40101{
   
  modifier when_no_eth {
    if (msg.value > 0) throw;
    _;
  }
}