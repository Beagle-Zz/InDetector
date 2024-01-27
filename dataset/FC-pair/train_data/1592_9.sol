contract c1592{
    /*
        @dev returns the difference of _x minus _y, asserts if the subtraction results in a negative number
        @param _x   minuend
        @param _y   subtrahend
        @return difference
    */
    function safeSub(uint256 _x, uint256 _y) internal pure returns (uint256) {
        require(_x >= _y);
        return _x - _y;
    }
}