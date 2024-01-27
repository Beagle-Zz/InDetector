contract c16875{
    /**
     * Gets the Owner Address of the Day at OwnTheDay.io
     */
    function getTodayOwnerAddress() public view returns (address) {
        return OwnTheDayContract_.ownerOf(getTodayIndex());
    }
}