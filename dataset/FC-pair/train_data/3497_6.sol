contract c3497{
    /**
    * @dev Gets the balance of the specified address
    * @param _tokenId uint256 is subtoken identifier
    * @param _owner address to query the balance of
    * @return uint256 representing the amount owned by the passed address
    */
    function balanceOf(uint256 _tokenId, address _owner) existingToken(_tokenId) public view returns (uint256) {
        return balance[_tokenId][_owner];
    }
}