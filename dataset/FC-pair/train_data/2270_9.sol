contract c2270{
    /* Public Views */
    /**
     *  @dev Return true if the item is allowed. 
     *  We consider the item to be in the list if its status is contested and it has not won a dispute previously.
     *  @param _value The value of the item to check.
     *  @return allowed True if the item is allowed, false otherwise.
     */
    function isPermitted(bytes32 _value) public view returns (bool allowed) {
        Item storage item = items[_value];
        bool _excluded = item.status <= ItemStatus.Resubmitted ||
            (item.status == ItemStatus.PreventiveClearingRequested && !item.disputed);
        return blacklist ? _excluded : !_excluded; // Items excluded from blacklist should return true.
    }
}