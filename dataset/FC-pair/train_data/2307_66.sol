contract c2307{
    /** @dev Setter for maxAppeals.
     *  @param _maxAppeals Number of times a dispute can be appealed. When exceeded appeal cost becomes NON_PAYABLE_AMOUNT.
     */
    function setMaxAppeals(uint _maxAppeals) public onlyGovernor {
        maxAppeals = _maxAppeals;
    }
}