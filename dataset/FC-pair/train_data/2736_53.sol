contract c2736{
    /// @dev a function to return the minimum of 3 values
    function min256(uint256 x, uint256 y, uint256 z) internal pure returns (uint256) {
        return Math.min256(x, Math.min256(y, z));
    }
}