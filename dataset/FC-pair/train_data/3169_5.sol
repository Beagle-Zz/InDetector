contract c3169{
    /**
     *  deleteUserClaim deletes user account
     *  @param _userAddress corresponds to address of user's wallet
     */
    function deleteUserClaim(address _userAddress)
        external onlyOwner returns (bool)
    {
        delete claimedTokens[_userAddress];
        emit DeletedClaim(_userAddress, 0, true);
        return true;
    }
}