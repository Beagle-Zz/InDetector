contract c18987{
    /*** SETTERS ***/
    /// @dev set new asset price
    /// @param _tokenId  asset UniqueId
    /// @param _price    asset price
    function setPrice(uint256 _tokenId, uint256 _price) public onlyGrantedContracts {
        assetIndexToPrice[_tokenId] = _price;
    }
}