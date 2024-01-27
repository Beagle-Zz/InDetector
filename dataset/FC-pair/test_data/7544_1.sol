contract c7544{
    /*
    uint128 functions
     */
    function madd(uint128 a, uint128 b) internal pure
    returns (uint128) {
        uint128 c = a + b;
        assert(c >= a);
        return c;
    }
}