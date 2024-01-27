contract c16350{
  // Getter function for token payouts mapping.
  function getPayouts(address acc) public returns (uint32) {
      return minerTokenPayouts[acc];
  }
}