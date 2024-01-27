contract c2270{
    /**
     *  @dev Return the values of the items the query finds.
     *  This function is O(n) at worst, where n is the number of items. This could exceed the gas limit, therefore this function should only be used for interface display and not by other contracts.
     *  @param _cursor The pagination cursor.
     *  @param _count The number of items to return.
     *  @param _filter The filter to use.
     *  @param _sort The sort order to use.
     *  @return The values of the items found and wether there are more items for the current filter and sort.
     */
    function queryItems(bytes32 _cursor, uint _count, bool[6] _filter, bool _sort) public view returns (bytes32[] values, bool hasMore) {
        uint _cursorIndex;
        values = new bytes32[](_count);
        uint _index = 0;
        if (_cursor == 0)
            _cursorIndex = 0;
        else {
            for (uint j = 0; j < itemsList.length; j++) {
                if (itemsList[j] == _cursor) {
                    _cursorIndex = j;
                    break;
                }
            }
            require(_cursorIndex != 0);
        }
        for (
                uint i = _cursorIndex == 0 ? (_sort ? 0 : 1) : (_sort ? _cursorIndex + 1 : itemsList.length - _cursorIndex + 1);
                _sort ? i < itemsList.length : i <= itemsList.length;
                i++
            ) { // Oldest or newest first
            Item storage item = items[itemsList[_sort ? i : itemsList.length - i]];
            if (
                item.status != ItemStatus.Absent && item.status != ItemStatus.PreventiveClearingRequested && (
                    (_filter[0] && (item.status == ItemStatus.Resubmitted || item.status == ItemStatus.Submitted)) || // Pending
                    (_filter[1] && item.disputed) || // Challenged
                    (_filter[2] && item.status == ItemStatus.Registered) || // Accepted
                    (_filter[3] && item.status == ItemStatus.Cleared) || // Rejected
                    (_filter[4] && item.submitter == msg.sender) || // My Submissions
                    (_filter[5] && item.challenger == msg.sender) // My Challenges
                )
            ) {
                if (_index < _count) {
                    values[_index] = itemsList[_sort ? i : itemsList.length - i];
                    _index++;
                } else {
                    hasMore = true;
                    break;
                }
            }
        }
    }
}