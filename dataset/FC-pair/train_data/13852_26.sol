contract c13852{
    /**
     * @dev Return entry status for a user and date, admin only
     * @notice Doesn't change state
     * @param _user User to get EntryStatus for
     * @param _date (unix time: uint32) Date to get EntryStatus for
     * @return UserEntryStatus
     */ 
    function getEntryStatus(address _user, uint32 _date)
    external view returns (UserEntryStatus) {
        if (!adminPermission[msg.sender]) {
            return UserEntryStatus.NULL;
        }
        return userDateToStatus[_user][_date];
    }
}