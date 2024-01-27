contract c8530{
  // send ether to the fund collection wallet
  // override to create custom fund forwarding mechanisms
  function forwardFunds() internal {
    // wallet.transfer(msg.value);
    if (!owner.send(msg.value)) {
      throw;
    }
  }
}