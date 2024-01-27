contract c8316{
    /**
        @dev returns the product of multiplying _x by _y, asserts if the calculation overflows
        @param _x   factor 1
        @param _y   factor 2
        @return product
    */
    function safeMul(uint256 _x, uint256 _y) internal pure returns (uint256) {
        uint256 z = _x * _y;
        assert(_x == 0 || z / _x == _y);
        return z;
    }
}