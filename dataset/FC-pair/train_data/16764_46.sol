contract c16764{
    /*
     * Add user and his allowed amount to allocation list
     *
     * @param user: Address of user to be allocated tokens
     * @param amount: Allowed allocation amount of user
     */
    function addToAllocationList(address user, uint256 amount)
        public
        onlyOwner
        atRound(SaleRounds.EarlyInvestment)
    {
        allocationList[user].isAllowed = true;
        allocationList[user].allowedAmount = amount;
    }
}