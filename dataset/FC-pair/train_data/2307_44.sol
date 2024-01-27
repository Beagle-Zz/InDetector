contract c2307{
    /** @dev Appeal a ruling. Note that it has to be called before the arbitrator contract calls rule.
     *  @param _disputeID ID of the dispute to be appealed.
     *  @param _extraData Standard but not used by this contract.
     */
    function appeal(uint _disputeID, bytes _extraData) public payable onlyDuring(Period.Appeal) {
        super.appeal(_disputeID,_extraData);
        Dispute storage dispute = disputes[_disputeID];
        require(msg.value >= appealCost(_disputeID, _extraData));
        require(dispute.session+dispute.appeals == session); // Dispute of the current session.
        require(dispute.arbitrated == msg.sender);
        dispute.appeals++;
        dispute.votes.length++;
        dispute.voteCounter.length++;
    }
}