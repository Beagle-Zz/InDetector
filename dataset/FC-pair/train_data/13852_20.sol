contract c13852{
    /**
     * @dev Get the last registered date for a user
     * @notice Doesn't change state
     * @return Last registered date (unix time: uint32), 0 if user has never registered
     */
    function getLastRegisterDate() internal view returns (uint32) {
        uint32[] memory dates = userToDates[msg.sender];
        uint256 pastRegisterCount = dates.length;
        if(pastRegisterCount == 0) {
            return 0;
        }
        return dates[pastRegisterCount.sub(1)];
    }
}