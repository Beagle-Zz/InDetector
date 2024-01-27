contract c4225{
    /*
    int256 functions
     */
    function imin(int256 x, int256 y) pure internal returns (int256 z) {
        return x <= y ? x : y;
    }
}