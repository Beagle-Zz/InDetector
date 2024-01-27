contract c16334{
    /**
     * @dev Integer division of two numbers, truncating the quotient.
     */
     function div(uint32 a, uint32 b) internal pure returns (uint32) {
     // assert(b > 0); // Solidity automatically throws when dividing by 0
     uint32 c = a / b;
     // assert(a == b * c + a % b); // There is no case in which this doesn’t hold
     return c;
     }
}