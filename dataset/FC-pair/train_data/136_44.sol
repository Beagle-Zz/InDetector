contract c136{
    /**
        @dev Internal function to generate a SPECIAL horsey token
            we then use the ERC721 inherited minting process
            the dna is a bytes32 target for a keccak256. Not using blockhash
            finaly, a bitmask zeros the first 2 bytes for rarity traits
        @param race Address of the associated race
        @param eth_address Address of the user to receive the token
        @param coinIndex The index of the winning coin
        @return ID of the token
    */
    function _generate_special_horsey(address race, address eth_address, bytes32 coinIndex) internal returns (uint256) {
        uint256 id = _makeSpecialId(race, eth_address, coinIndex);
        //generate dna
        bytes32 dna = _shiftRight(keccak256(abi.encodePacked(race, coinIndex)),16);
         //storeHorsey checks if the token exists before minting already, so we dont have to here
        stables.storeHorsey(eth_address,id,race,dna,1,0);
        return id;
    }
}