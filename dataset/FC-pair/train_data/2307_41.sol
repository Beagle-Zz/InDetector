contract c2307{
    // **************************** //
    // *      Court functions     * //
    // *     Constant and Pure    * //
    // **************************** //
    /** @dev Return the amount of jurors which are or will be drawn in the dispute.
     *  The number of jurors is doubled and 1 is added at each appeal. We have proven the formula by recurrence.
     *  This avoid having a variable number of jurors which would be updated in order to save gas.
     *  @param _disputeID The ID of the dispute we compute the amount of jurors.
     *  @return nbJurors The number of jurors which are drawn.
     */
    function amountJurors(uint _disputeID) public view returns (uint nbJurors) {
        Dispute storage dispute = disputes[_disputeID];
        return (dispute.initialNumberJurors + 1) * 2**dispute.appeals - 1;
    }
}