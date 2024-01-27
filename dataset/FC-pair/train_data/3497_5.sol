contract c3497{
    /**
    * @dev Gets the total amount of tokens stored by the contract
    * @param _tokenId uint256 is subtoken identifier
    * @return uint256 representing the total amount of tokens
    */
    function totalSupply(uint256 _tokenId) existingToken(_tokenId) public view returns (uint256) {
        return totalSupply_[_tokenId];
    }
}