contract c13852{
    /**
     * @dev Return all registered dates for a user, admin only
     * @notice Doesn't change state
     * @param _user User to get dates for
     * @return All dates(uint32[]) the user registered for
     */ 
    function getDatesForUser(address _user) external view returns (uint32[]) {
        if (!adminPermission[msg.sender]) {
           return new uint32[](0); 
        }
        return userToDates[_user];
    }
}