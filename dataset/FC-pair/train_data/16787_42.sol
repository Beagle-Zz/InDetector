contract c16787{
  /**
   * @dev This is separated as a function because it can be called separately to avoid costs as it is view only
   * @param _currency currency symbol
   * @return the hash of the currency (no security needed - just so it can be mapped)
   */
   function currencyToHash(string _currency) public pure returns(bytes32) {
     return keccak256(_currency);
   }
}