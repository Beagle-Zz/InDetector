contract c13852{
    /**
     * @dev Return all registered users for a date, admin only
     * @notice Doesn't change state
     * @param _date Date to get users for
     * @return All users(address[]) registered on a given date
     */ 
    function getUsersForDate(uint32 _date) external view returns (address[]) {
        if (!adminPermission[msg.sender]) {
           return new address[](0); 
        }
        return dateToUsers[_date];
    }
}