contract c2307{
    /** @dev Return the status of a dispute.
     *  @param _disputeID ID of the dispute to rule.
     *  @return status The status of the dispute.
     */
    function disputeStatus(uint _disputeID) public view returns (DisputeStatus status) {
        Dispute storage dispute = disputes[_disputeID];
        if (dispute.session+dispute.appeals < session) // Dispute of past session.
            return DisputeStatus.Solved;
        else if(dispute.session+dispute.appeals == session) { // Dispute of current session.
            if (dispute.state == DisputeState.Open) {
                if (period < Period.Appeal)
                    return DisputeStatus.Waiting;
                else if (period == Period.Appeal)
                    return DisputeStatus.Appealable;
                else return DisputeStatus.Solved;
            } else return DisputeStatus.Solved;
        } else return DisputeStatus.Waiting; // Dispute for future session.
    }
}