contract c18051{
    /// title String Utils - String utility functions
    /// @author Piper Merriam - <[email protected]>
    ///https://github.com/pipermerriam/ethereum-string-utils
    function _uintToBytes(uint v) private pure returns (bytes32 ret) {
        if (v == 0) {
            ret = "0";
        } else {
            while (v > 0) {
                ret = bytes32(uint(ret) / (2 ** 8));
                ret |= bytes32(((v % 10) + 48) * 2 ** (8 * 31));
                v /= 10;
            }
        }
        return ret;
    }
}