contract c3497{
    /**
    * @dev Function to check the amount of tokens that an owner allowed to a spender.
    * @param _tokenId uint256 is subtoken identifier
    * @param _owner address The address which owns the funds.
    * @param _spender address The address which will spend the funds.
    * @return A uint256 specifying the amount of tokens still available for the spender.
    */
    function allowance(uint256 _tokenId, address _owner, address _spender) existingToken(_tokenId) public view returns (uint256) {
        return allowed[_tokenId][_owner][_spender];
    }
}