contract c10476{
    // Returns whether or not the day is already bought
    function hasOwner(uint16 dayId) private view
    returns (bool dayHasOwner) {
        return dayStructs[dayId].owner != address(0);
    }
}