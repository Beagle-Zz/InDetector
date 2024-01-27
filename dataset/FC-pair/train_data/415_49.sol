contract c415{
    // **************************** //
    // *   Arbitrator functions   * //
    // *   Modifying the state    * //
    // **************************** //
    /** @dev Create a dispute. Must be called by the arbitrable contract.
     *  Must be paid at least arbitrationCost().
     *  @param _choices Amount of choices the arbitrator can make in this dispute.
     *  @param _extraData Null for the default number. Otherwise, first 16 bytes will be used to return the number of jurors.
     *  @return disputeID ID of the dispute created.
     */
    function createDispute(uint _choices, bytes _extraData) public payable returns (uint disputeID) {
        uint16 nbJurors = extraDataToNbJurors(_extraData);
        require(msg.value >= arbitrationCost(_extraData));
        disputeID = disputes.length++;
        Dispute storage dispute = disputes[disputeID];
        dispute.arbitrated = Arbitrable(msg.sender);
        if (period < Period.Draw) // If drawing did not start schedule it for the current session.
            dispute.session = session;
        else // Otherwise schedule it for the next one.
            dispute.session = session+1;
        dispute.choices = _choices;
        dispute.initialNumberJurors = nbJurors;
        dispute.arbitrationFeePerJuror = arbitrationFeePerJuror; // We store it as the general fee can be changed through the governance mechanism.
        dispute.votes.length++;
        dispute.voteCounter.length++;
        DisputeCreation(disputeID, Arbitrable(msg.sender));
        return disputeID;
    }
}