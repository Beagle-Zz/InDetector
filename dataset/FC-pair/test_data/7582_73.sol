contract c7582{
    /**
     * @notice Get the quantity of havvens associated with a given schedule entry.
     */
    function getVestingQuantity(address account, uint index)
        public
        view
        returns (uint)
    {
        return getVestingScheduleEntry(account,index)[QUANTITY_INDEX];
    }
}