contract c1986{
  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(int256 a, int256 b) internal pure returns (int256) {
    int256 c = a + b;
    if(a>0 && b>0) {
    	assert(c > a);
    } else if (a < 0 && b < 0) {
    	assert(c < a);
    }
    return c;
  }
}