contract c16856{
   /**
   * @dev Multiplies two numbers, revert()s on overflow.
   */
   function mul(uint256 a, uint256 b) internal returns (uint256 c) {
     if (a == 0) {
       return 0;
     }
     c = a * b;
     assert(c / a == b);
     return c;
   }
}