contract c11301{
    // Check if it is safe to multiply two numbers
    function safeMultiply(uint256 a, uint256 b) internal pure returns (uint256) {
        uint c = a * b;
        assert(a == 0 || (c / a) == b);
        return c;
    }
}