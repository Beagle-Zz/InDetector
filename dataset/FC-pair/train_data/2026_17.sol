contract c2026{
    /**
        @dev Returns the current amount of active owners, ie share above 0
     */
    function getCurrentOwners() public view returns (uint) {
        return ownerMap.size();
    }
}