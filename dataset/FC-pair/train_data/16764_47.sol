contract c16764{
    /*
     * Add users and their allowed amount to allocation list
     *
     * @param users: List of Address to be allocated tokens
     * @param amount: List of allowed allocation amount of each user
     */
    function addManyToAllocationList(address[] users, uint256[] amounts)
        external
        onlyOwner
        atRound(SaleRounds.EarlyInvestment)
    {
        require(users.length == amounts.length);
        for (uint32 i = 0; i < users.length; i++) {
            addToAllocationList(users[i], amounts[i]);
        }
    }
}