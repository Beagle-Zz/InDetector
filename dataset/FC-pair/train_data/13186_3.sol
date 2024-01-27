contract c13186{
    /**
     * Divide of two numbers (a by b), truncating the quotient.
    **/
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // require(b > 0); // Solidity automatically throws when dividing by 0
        return a / b;
    }
}