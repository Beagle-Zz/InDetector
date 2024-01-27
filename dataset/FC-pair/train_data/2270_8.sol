contract c2270{
    /**
     *  @dev Execute a request after the time for challenging it has passed. Can be called by anyone.
     *  @param _value The value of the item with the request to execute.
     */
    function executeRequest(bytes32 _value) public {
        Item storage item = items[_value];
        require(now - item.lastAction >= timeToChallenge);
        require(!item.disputed);
        if (item.status == ItemStatus.Resubmitted || item.status == ItemStatus.Submitted)
            item.status = ItemStatus.Registered;
        else if (item.status == ItemStatus.ClearingRequested || item.status == ItemStatus.PreventiveClearingRequested)
            item.status = ItemStatus.Cleared;
        else
            revert();
        item.submitter.send(item.balance); // Deliberate use of send in order to not block the contract in case of reverting fallback.
        emit ItemStatusChange(item.submitter, item.challenger, _value, item.status, item.disputed);
    }
}