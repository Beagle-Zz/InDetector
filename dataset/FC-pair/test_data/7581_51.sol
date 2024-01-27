contract c7581{
    /* ========== MUTATIVE FUNCTIONS ========== */
    /**
     * @notice Withdraws a quantity of havvens back to the havven contract.
     * @dev This may only be called by the owner during the contract's setup period.
     */
    function withdrawHavvens(uint quantity)
        external
        onlyOwner
        onlyDuringSetup
    {
        havven.transfer(havven, quantity);
    }
}