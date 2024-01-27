contract c4401{
    /*
    uint128 functions (h is for half)
     */
    function hadd(uint128 x, uint128 y) pure internal returns (uint128 z) {
        assert((z = x + y) >= x);
    }
}