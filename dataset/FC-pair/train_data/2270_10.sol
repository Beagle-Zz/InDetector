contract c2270{
    /* Internal */
    /**
     *  @dev Execute the ruling of a dispute.
     *  @param _disputeID ID of the dispute in the Arbitrator contract.
     *  @param _ruling Ruling given by the arbitrator. Note that 0 is reserved for "Not able/wanting to make a decision".
     */
    function executeRuling(uint _disputeID, uint _ruling) internal {
        Item storage item = items[disputeIDToItem[_disputeID]];
        require(item.disputed);
        if (_ruling == REGISTER) {
            if (rechallengePossible && item.status==ItemStatus.Submitted) {
                uint arbitratorCost = arbitrator.arbitrationCost(arbitratorExtraData);
                if (arbitratorCost + stake < item.balance) { // Check that the balance is enough.
                    uint toSend = item.balance - (arbitratorCost + stake);
                    item.submitter.send(toSend); // Keep the arbitration cost and the stake and send the remaining to the submitter.
                    item.balance -= toSend;
                }
            } else {
                if (item.status==ItemStatus.Resubmitted || item.status==ItemStatus.Submitted)
                    item.submitter.send(item.balance); // Deliberate use of send in order to not block the contract in case of reverting fallback.
                else
                    item.challenger.send(item.balance);
                item.status = ItemStatus.Registered;
            }
        } else if (_ruling == CLEAR) {
            if (item.status == ItemStatus.PreventiveClearingRequested || item.status == ItemStatus.ClearingRequested)
                item.submitter.send(item.balance);
            else
                item.challenger.send(item.balance);
            item.status = ItemStatus.Cleared;
        } else { // Split the balance 50-50 and give the item the initial status.
            if (item.status==ItemStatus.Resubmitted)
                item.status = ItemStatus.Cleared;
            else if (item.status==ItemStatus.ClearingRequested)
                item.status = ItemStatus.Registered;
            else
                item.status = ItemStatus.Absent;
            item.submitter.send(item.balance / 2);
            item.challenger.send(item.balance / 2);
        }
        item.disputed = false;
        if (rechallengePossible && item.status==ItemStatus.Submitted && _ruling==REGISTER) 
            item.lastAction=now; // If the item can be rechallenged, update the time and keep the remaining balance.
        else
            item.balance = 0;
        emit ItemStatusChange(item.submitter, item.challenger, disputeIDToItem[_disputeID], item.status, item.disputed);
    }
}