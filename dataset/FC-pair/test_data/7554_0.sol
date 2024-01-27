contract c7554{
    /*
    standard uint256 functions
     */
    function add(uint256 x, uint256 y) constant internal returns (uint256 z) {
        assert((z = x + y) >= x);
    }
}