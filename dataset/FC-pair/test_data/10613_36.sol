contract c10613{
    /**
     * Test copy byte array
     *
     * @param arrToCopy Array to copy
     * @return byte array
     */
    function testCopy(bytes arrToCopy)
        public
        pure
        returns (bytes)
    {
        bytes memory arr = new bytes(arrToCopy.length);
        uint index;
        assembly {
            index := add(arr, 0x20)
        }
        ArrayUtils.unsafeWriteBytes(index, arrToCopy);
        return arr;
    }
}