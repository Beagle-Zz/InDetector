contract c11005{
  /**
   * @dev Allows draining of Ether
   * @param amount Amount to drain
   */
  function emergencyEthDrain(uint amount) public ownerOnly returns (bool){
    return owner.send(amount);
  }
}