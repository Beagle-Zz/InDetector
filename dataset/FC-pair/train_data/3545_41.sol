contract c3545{
    /**
    * @dev Gets the genome of the active hero
    * @param _owner the address to get hero of
    */
    function activeHeroGenome(address _owner) public view returns (uint256) {
        uint256 tokenId = activeHero[_owner];
        if (tokenId == 0) {
            return 0;
        }
        return genome[tokenId];
    }
}