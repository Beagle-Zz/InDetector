contract c16764{
    /*
     * Remove user from allocation list
     *
     * @param user: Address of user to be removed
     */
    function removeFromAllocationList(address user)
        public
        onlyOwner
        atRound(SaleRounds.EarlyInvestment)
    {
        allocationList[user].isAllowed = false;
    }
}