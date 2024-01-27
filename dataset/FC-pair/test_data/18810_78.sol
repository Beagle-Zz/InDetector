contract c18810{
    /* Obtain the quantity which the next schedule entry will vest for a given user. */
    function getNextVestingQuantity(address account)
        external
        view
        returns (uint)
    {
        uint index = getNextVestingIndex(account);
        if (index == numVestingEntries(account)) {
            return 0;
        }
        return getVestingQuantity(account, index);
    }
}