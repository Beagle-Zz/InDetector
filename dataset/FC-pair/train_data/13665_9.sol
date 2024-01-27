contract c13665{
    //FUNCTIONALTIY
    /**
    * @notice checks if a user owns a token
    * @param userAddress - The address to check.
    * @param tokenId - ID of the token that needs to be verified.
    * @return true if the userAddress provided owns the token.
    */
    function _userOwnsToken(address userAddress, uint256 tokenId) internal view returns (bool){
         return ownerOfTokenMap[tokenId] == userAddress;
    }
}