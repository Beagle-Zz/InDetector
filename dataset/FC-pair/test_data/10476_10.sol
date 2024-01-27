contract c10476{
    // Owner can tranfer his day to another address
    function transferDay(uint16 dayId, address recipient) public
        onlyValidDay(dayId)
        onlyDayOwner(dayId) {
        dayStructs[dayId].owner = recipient;
    }
}