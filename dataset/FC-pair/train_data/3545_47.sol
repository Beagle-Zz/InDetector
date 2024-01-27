contract c3545{
    /**
    * @dev Allows setting hero genome
    * @param _tokenId token to set data for
    * @param _genome genome data to set
    */
    function setGenome(uint256 _tokenId, uint256 _genome) external onlyLogicContract {
        genome[_tokenId] = _genome;
    }
}