contract c40077{
     
    function _setPackedBlockNumber(bytes20 blobId, uint offset) internal {
         
        bytes32 slot = packedBlockNumbers[blobId][offset / 8];
         
        slot &= ~bytes32(uint32(-1) * 2**((offset % 8) * 32));
         
        slot |= bytes32(uint32(block.number) * 2**((offset % 8) * 32));
         
        packedBlockNumbers[blobId][offset / 8] = slot;
    }
}