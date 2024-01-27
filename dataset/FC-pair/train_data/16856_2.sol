contract c16856{
   /**
   * @dev Subtracts two numbers, revert()s on overflow (i.e. if subtrahend is greater than minuend).
   */
   function sub(uint256 a, uint256 b) internal returns (uint256) {
     assert(b <= a);
     return a - b;
   }
}