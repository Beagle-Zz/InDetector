contract c16856{
   /**
   * @dev Adds two numbers, revert()s on overflow.
   */
   function add(uint256 a, uint256 b) internal returns (uint256 c) {
     c = a + b;
     assert(c >= a && c >= b);
     return c;
   }
}