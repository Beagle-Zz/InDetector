contract c16407{
    /**
    * @dev Put Chibi up for fusion, this will not destroy your Chibi. Only adults can fuse.
    * @param _tokenId Id of Chibi token that is for fusion
    * @param _price Price for the chibi in wei
    */
    function setChibiForFusion(uint _tokenId, uint _price) public returns (bool success) {
        require(ownerOf(_tokenId) == msg.sender);
        require(_price >= priceFusionChibi);
        require(chibies[_tokenId].adult <= now);
        require(chibies[_tokenId].exhausted <= now);
        require(chibies[_tokenId].forFusion == false);
        require(battleContract.isDead(_tokenId) == false);
        chibies[_tokenId].forFusion = true;
        chibies[_tokenId].fusionPrice = _price;
        emit ChibiForFusion(_tokenId, _price);
        return true;
    }
}