contract c2307{
    /** @dev Compute the cost of appeal. It is recommended not to increase it often, 
     *  as it can be highly time and gas consuming for the arbitrated contracts to cope with fee augmentation.
     *  @param _disputeID ID of the dispute to be appealed.
     *  @param _extraData Is not used there.
     *  @return fee Amount to be paid.
     */
    function appealCost(uint _disputeID, bytes _extraData) public view returns (uint fee) {
        Dispute storage dispute = disputes[_disputeID];
        if(dispute.appeals >= maxAppeals) return NON_PAYABLE_AMOUNT;
        return (2*amountJurors(_disputeID) + 1) * dispute.arbitrationFeePerJuror;
    }
}