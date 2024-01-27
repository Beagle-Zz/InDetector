contract c7581{
    /**
     * @notice Obtain the quantity which the next schedule entry will vest for a given user.
     */
    function getNextVestingQuantity(address account)
        external
        view
        returns (uint)
    {
        return getNextVestingEntry(account)[QUANTITY_INDEX];
    }
}