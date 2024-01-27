contract c13332{
    /**
     * Utility costly function to encode bytes HEX representation as string.
     * @param sig - signature to encode.
     */
    function hexToString (bytes32 sig) internal pure returns (bytes) { // /to-try/ convert to two uint256 and test gas
        bytes memory str = new bytes(64);
        for (uint8 i = 0; i < 32; ++i) {
            str[2 * i] = byte((uint8(sig[i]) / 16 < 10 ? 48 : 87) + uint8(sig[i]) / 16);
            str[2 * i + 1] = byte((uint8(sig[i]) % 16 < 10 ? 48 : 87) + (uint8(sig[i]) % 16));
        }
        return str;
    }
}