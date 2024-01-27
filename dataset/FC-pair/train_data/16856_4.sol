contract c16856{
  /**
   * @dev Fix for the ERC20 short address attack.
   */
  modifier onlyPayloadSize(uint size) {
     if(msg.data.length < size.add(4)) {
       revert();
     }
     _;
  }
}