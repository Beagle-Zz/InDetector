contract c16764{
    /*
     * Remove users from allocation list
     *
     * @param user: Address list of users to be removed
     */
    function removeManyFromAllocationList(address[] users)
        external
        onlyOwner
        atRound(SaleRounds.EarlyInvestment)
    {
        for (uint32 i = 0; i < users.length; i++) {
            removeFromAllocationList(users[i]);
        }
    }
}