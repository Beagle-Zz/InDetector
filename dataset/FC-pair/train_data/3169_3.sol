contract c3169{
    /**
     *  updateUserClaim updates user claim status and adds token to his wallet
     *  @param _userAddress address of user's wallet
     *  @param _tokens corresponds to user's token that is to be claimed.
     */
    function updateUserClaim(address _userAddress, uint256 _tokens)
        external onlyOwner returns (bool)
    {
        claimedTokens[_userAddress] = claimedTokens[_userAddress] + _tokens;
        emit UpdatedClaim(_userAddress, _tokens, false);
        return true;
    }
}