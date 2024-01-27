contract c2325{
  /**
   * Distribute tokens to selected team members & founders.
   * Unit of Allowance is ETH and is converted in number of tokens by multiplying with Rate.
   * This can be called by any whitelisted beneficiary.
   */
  function airdrop() public {
    airdropFor(msg.sender);
  }
}