contract c2307{
    // **************************** //
    // *   Arbitrator functions   * //
    // *    Constant and pure     * //
    // **************************** //
    /** @dev Compute the cost of arbitration. It is recommended not to increase it often, 
     *  as it can be highly time and gas consuming for the arbitrated contracts to cope with fee augmentation.
     *  @param _extraData Null for the default number. Other first 16 bits will be used to return the number of jurors.
     *  @return fee Amount to be paid.
     */
    function arbitrationCost(bytes _extraData) public view returns (uint fee) {
        return extraDataToNbJurors(_extraData) * arbitrationFeePerJuror;
    }
}