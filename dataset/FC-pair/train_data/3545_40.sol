contract c3545{
    /**
    * @dev Queries list of tokens owned by a specific address
    * @param _owner the address to get tokens of
    */
    function tokensOfOwner(address _owner) external view returns (uint256[]) {
        return ownedTokens[_owner];
    }
}