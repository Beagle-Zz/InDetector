contract c13665{
    /**
    * @notice checks if the address provided is approved for a given token 
    * @param userAddress 
    * @param tokenId 
    * @return true if it is aproved
    */
    function _tokenIsApproved(address userAddress, uint256 tokenId) internal view returns (bool) {
        return tokensApprovedMap[tokenId] == userAddress;
    }
}