contract c13186{
    /**
     * Subtracts two numbers a and b, throws on overflow (i.e. if b is greater than a).
    **/
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        return a - b;
    }
}