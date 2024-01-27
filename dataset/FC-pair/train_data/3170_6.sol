contract c3170{
    /**
     *  deleteUserClaimInBulk deletes user account in bulk
     */
    function deleteUserClaimInBulk(address[] _userAddresses)
        external onlyOwner returns (bool)
    {
        for (uint16 i = 0; i < _userAddresses.length; i++) {
            delete claimedTokens[_userAddresses[i]];
            emit DeletedClaim(_userAddresses[i], 0, true);
        }
        return true;
    }
}