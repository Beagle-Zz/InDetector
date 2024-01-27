contract c2990{
    /**
     * @dev Returns a memory pointer to the data portion of the provided bytes array.
     * @param bts Memory byte array
     */
    function dataPtr(bytes memory bts) internal pure returns (uint256 addr) {
        assembly {
            addr := add(bts, /*BYTES_HEADER_SIZE*/ 32)
        }
    }
}