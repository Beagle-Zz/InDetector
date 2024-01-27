contract c10469{
    /// @notice Compute the largest integer smaller than or equal to 
    /// the binary logarithm of the input
    /// @param _n Operand of the function
    /// @return Floor(Log2(_n))
    function floorLog2(uint256 _n) internal pure returns (uint8) {
        uint8 res = 0;
        if (_n < 256) {
            // At most 8 iterations
            while (_n > 1) {
                _n >>= 1;
                res += 1;
            }
        }
        else {
            // Exactly 8 iterations
            for (uint8 s = 128; s > 0; s >>= 1) {
                if (_n >= (ONE << s)) {
                    _n >>= s;
                    res |= s;
                }
            }
        }
        return res;
    }    
}