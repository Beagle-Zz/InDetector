contract c3497{
    /**
    * @dev Throws if  _tokenId exists
    * @param _tokenId uint256 is subtoken identifier
    */
    modifier notExistingToken(uint256 _tokenId) {
        require(totalSupply_[_tokenId] == 0 && (_tokenId & mask == _tokenId));
        _;
    }
}