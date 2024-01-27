contract c18087{
    // Overflow protected math functions
    /**
        @dev returns the sum of _x and _y, asserts if the calculation overflows
        @param _x   value 1
        @param _y   value 2
        @return sum
    */
    function safeAdd(uint256 _x, uint256 _y) internal pure returns (uint256) {
        uint256 z = _x + _y;
        assert(z >= _x);
        return z;
    }
}