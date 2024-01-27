contract c3545{
    /**
    * @dev Sets the specified token as user's active Hero
    * @param _tokenId the hero token to set as active
    */
    function setActiveHero(uint256 _tokenId) external onlyOwnerOf(_tokenId) {
        activeHero[msg.sender] = _tokenId;
        emit ActiveHeroChanged(msg.sender, _tokenId);
    }
}