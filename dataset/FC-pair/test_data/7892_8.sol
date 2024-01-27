contract c7892{
    // Check if it is safe to subtract two numbers
    function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
        uint c = a - b;
        assert(b <= a && c <= a);
        return c;
    }
}