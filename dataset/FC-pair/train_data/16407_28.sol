contract c16407{
    /** 
     * @dev Exhaust Chibis after battle
     */
    function exhaustChibis(uint _tokenId1, uint _tokenId2) public returns (bool success) {
        require(msg.sender == battleContractAddress);
        chibies[_tokenId1].exhausted = now.add(exhaustBattle(_tokenId1));
        chibies[_tokenId2].exhausted = now.add(exhaustBattle(_tokenId2)); 
        return true;
    }
}