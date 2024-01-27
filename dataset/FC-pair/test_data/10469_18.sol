contract c10469{
    /// @notice Compute the natural logarithm
    /// @dev This functions assumes that the numerator is larger than or equal 
    /// to the denominator, because the output would be negative otherwise.
    /// @param _numerator is a value between 1 and 2 ^ (256 - MAX_PRECISION) - 1
    /// @param _denominator is a value between 1 and 2 ^ (256 - MAX_PRECISION) - 1
    /// @return is a value between 0 and floor(ln(2 ^ (256 - MAX_PRECISION) - 1) * 2 ^ MAX_PRECISION)
    function ln(uint256 _numerator, uint256 _denominator) internal pure returns (uint256) {
        assert(_numerator <= MAX_NUM);
        uint256 res = 0;
        uint256 x = _numerator * FIXED_1 / _denominator;
        // If x >= 2, then we compute the integer part of log2(x), which is larger than 0.
        if (x >= FIXED_2) {
            uint8 count = floorLog2(x / FIXED_1);
            x >>= count; // now x < 2
            res = count * FIXED_1;
        }
        // If x > 1, then we compute the fraction part of log2(x), which is larger than 0.
        if (x > FIXED_1) {
            for (uint8 i = MAX_PRECISION; i > 0; --i) {
                x = (x * x) / FIXED_1; // now 1 < x < 4
                if (x >= FIXED_2) {
                    x >>= 1; // now 1 < x < 2
                    res += ONE << (i - 1);
                }
            }
        }
        return ((res * LN2_MANTISSA) >> LN2_EXPONENT) / FIXED_3;
    }
}