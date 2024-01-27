contract c16875{
    /**
     * Gets the Owner Name of the Day at OwnTheDay.io
     */
    function getTodayOwnerName() public view returns (string) {
        address dayOwner = OwnTheDayContract_.ownerOf(getTodayIndex());
        return playerData_[dayOwner].name; // Get Name from THIS contract
    }
}