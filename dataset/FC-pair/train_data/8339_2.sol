contract c8339{
    /*
    uint64 functions
     */
    function miadd(uint64 a, uint64 b) internal 
    returns (uint64) {
        uint64 c = a + b;
        assert(c >= a);
        return c;
    }
}