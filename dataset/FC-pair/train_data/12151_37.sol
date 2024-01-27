contract c12151{
    /**
     * Test write address to bytes
     *
     * @param addr Address to write
     * @return byte array
     */
    function testCopyAddress(address addr)
        public
        pure
        returns (bytes)
    {
        bytes memory arr = new bytes(0x14);
        uint index;
        assembly {
            index := add(arr, 0x20)
        }
        ArrayUtils.unsafeWriteAddress(index, addr);
        return arr;
    }
}