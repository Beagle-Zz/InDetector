contract c7544{
    /*
    standard uint256 functions
     */
    function add(uint256 a, uint256 b) internal pure
    returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}