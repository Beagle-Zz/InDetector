contract c1316{
    /*
    uint64 functions
     */
    function miadd(uint64 a, uint64 b) internal pure
    returns (uint64) {
        uint64 c = a + b;
        assert(c >= a);
        return c;
    }
}