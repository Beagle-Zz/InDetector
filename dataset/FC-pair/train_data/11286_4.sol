contract c11286{
  /**
   *
   * Fix for the ERC20 short address attack
   *
   * http://vessenes.com/the-erc20-short-address-attack-explained/
   */
   modifier onlyPayloadSize(uint size) {
     assert(msg.data.length == size + 4);
     _;
   } 
}