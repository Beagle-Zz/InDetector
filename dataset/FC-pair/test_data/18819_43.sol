contract c18819{
  /**
   * The basic entry point to participate in the crowdsale process.
   *
   * Pay for funding, get invested tokens back in the sender address.
   */
  function buy() public payable {
    buyOnBehalf(msg.sender);
  }
}