contract c2270{
    /* Public */
    /**
     *  @dev Request for an item to be registered.
     *  @param _value The value of the item to register.
     */
    function requestRegistration(bytes32 _value) public payable {
        Item storage item = items[_value];
        uint arbitratorCost = arbitrator.arbitrationCost(arbitratorExtraData);
        require(msg.value >= stake + arbitratorCost);
        if (item.status == ItemStatus.Absent)
            item.status = ItemStatus.Submitted;
        else if (item.status == ItemStatus.Cleared)
            item.status = ItemStatus.Resubmitted;
        else
            revert(); // If the item is neither Absent nor Cleared, it is not possible to request registering it.
        if (item.lastAction == 0) {
            itemsList.push(_value);
        }
        item.submitter = msg.sender;
        item.balance += msg.value;
        item.lastAction = now;
        emit ItemStatusChange(item.submitter, item.challenger, _value, item.status, item.disputed);
    }
}