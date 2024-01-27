contract c135{
    /**
        @dev Returns horsey data of a given token
        @param tokenId ID of the horsey to fetch
        @return (race address, dna, feedingCounter, name)
    */
    function getHorsey(uint256 tokenId) public view returns (address, bytes32, uint8, string) {
        RoyalStablesInterface.Horsey memory temp;
        (temp.race,temp.dna,temp.feedingCounter,temp.tier) = stables.horseys(tokenId);
        return (temp.race,temp.dna,temp.feedingCounter,stables.names(tokenId));
    }
}