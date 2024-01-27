contract c10476{
    // Owner can change personal message of his days
    function changeMessage(uint16 dayId, string message) public
        onlyValidDay(dayId)
        onlyDayOwner(dayId)
        onlyValidMessage(message) {
        dayStructs[dayId].message = message;
    }
}