contract c4401{
    /*
    standard uint256 functions
     */
    function add(uint256 x, uint256 y) pure internal returns (uint256 z) {
        assert((z = x + y) >= x);
    }
}