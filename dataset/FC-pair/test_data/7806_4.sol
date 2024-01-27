contract c7806{
  // send ether to the fund collection wallet
  function forwardFunds() internal {
    owner.transfer(msg.value);
  }
}