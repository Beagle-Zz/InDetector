contract c217{
    /// @dev shifts a bytes32 left by n positions
    function _shiftLeft(bytes32 data, uint n) internal pure returns (bytes32) {
        return bytes32(uint256(data)*(2 ** n));
    }
}