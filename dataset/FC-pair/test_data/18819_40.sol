contract c18819{
  /**
   * Buys tokens on behalf of an address.
   *
   * Pay for funding, get invested tokens back in the receiver address.
   */
  function buyOnBehalf(address receiver) public payable unsignedBuyAllowed {
    require(!requireCustomerId); // Crowdsale needs to track participants for thank you email
    investInternal(receiver, 0);
  }
}