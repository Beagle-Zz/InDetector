contract c8715{
    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "div by zero");
        uint256 c = a / b;
        return c;
    }
}