contract c18733{
    /**
     * The owner can unlock the fund with this function. The use-
     * case for this is when the owner decides after the deadline
     * to allow contributors to be refunded their contributions.
     * Note that the fund would be automatically unlocked if the
     * minimum funding goal were not reached.
     */
    function ownerUnlockFund() external afterDeadline onlyOwner {
        fundingGoalReached = false;
    }
}