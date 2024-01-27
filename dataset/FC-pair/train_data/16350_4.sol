contract c16350{
  // Getter function for token balance mapping.
  function getBalance(address acc) public returns (uint32) {
      return minerTokens[acc];
    }
}