contract c7497{
    /*
    int256 functions
     */
    function imin(int256 x, int256 y) constant internal returns (int256 z) {
        return x <= y ? x : y;
    }
}