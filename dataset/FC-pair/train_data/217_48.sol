contract c217{
    /**
        @dev Internal function called to increase a horsey rarity
            We generate a random zeros mask with a single 1 in the leading 16 bits
        @param tokenId Id of the token to increase rarity of
        @param blockHash hash of the block where the feeding began
    */
    function _increaseRarity(uint256 tokenId, bytes32 blockHash) private {
        uint8 tier;
        bytes32 dna;
        (,dna,,tier) = stables.horseys(tokenId);
        if(tier < 255)
            stables.modifyHorseyTier(tokenId,tier+1);
        uint256 random = uint256(keccak256(abi.encodePacked(tokenId, blockHash)));
        //this creates a mask of 256 bits such as one of the first 16 bits will be 1
        bytes32 rarityMask = _shiftLeft(bytes32(1), (random % 16 + 240));
        bytes32 newdna = dna | rarityMask; //apply mask to add the random flag
        stables.modifyHorseyDna(tokenId,newdna);
    }
}