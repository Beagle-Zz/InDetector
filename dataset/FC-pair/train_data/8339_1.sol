contract c8339{
    /*
    uint128 functions
     */
    function madd(uint128 a, uint128 b) internal 
    returns (uint128) {
        uint128 c = a + b;
        assert(c >= a);
        return c;
    }
}