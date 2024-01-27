contract c8529{
    /**
        @dev utility, converts bytes32 to a string
        note that the bytes32 argument is assumed to be UTF8 encoded ASCII string
        @return string representation of the given bytes32 argument
    */
    function bytes32ToString(bytes32 _bytes) private pure returns (string) {
        bytes memory byteArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            byteArray[i] = _bytes[i];
        }
        return string(byteArray);
    }
}