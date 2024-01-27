contract c16334{
    /**
     * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
     */
     function sub(uint32 a, uint32 b) internal pure returns (uint32) {
     assert(b <= a);
     uint32 c = a - b;
     return c;
     }
}