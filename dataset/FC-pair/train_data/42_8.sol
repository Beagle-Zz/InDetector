contract c42{
  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(int256 a, int256 b) internal pure returns (int256) {
    int256 c = a - b;
    if(a>0 && b<0) {
    	assert (c > a);	
    } else if(a<0 && b>0) {
    	assert (c < a);
    }
   	return c;
  }
}