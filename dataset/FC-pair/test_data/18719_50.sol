contract c18719{
  /**
   * Returns any excess wei received
   * 
   * This function can be overriden to provide a different refunding method.
   */
  function returnExcedent(uint excedent, address receiver) internal {
    if (excedent > 0) {
      receiver.transfer(excedent);
    }
  }
}