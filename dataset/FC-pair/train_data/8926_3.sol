contract c8926{
    /**
     * Utility costly function to encode bytes HEX representation as string.
     * @param sig - signature as bytes32 to represent as string
     */
    function hexToString (bytes32 sig) internal pure returns (bytes) {
        bytes memory str = new bytes(64);
        for (uint8 i = 0; i < 32; ++i) {
            str[2 * i] = byte((uint8(sig[i]) / 16 < 10 ? 48 : 87) + uint8(sig[i]) / 16);
            str[2 * i + 1] = byte((uint8(sig[i]) % 16 < 10 ? 48 : 87) + (uint8(sig[i]) % 16));
        }
        return str;
    }
}