contract c13186{
    /**
     * Get the balance of the specified address.
     * @param account - The address to query the the balance of.
     * @return An uint256 representing the amount owned by the passed address.
    **/
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}