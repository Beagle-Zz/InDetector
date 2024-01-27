contract c13186{
    /**
     * Check the amount of tokens that an owner allowed to a spender.
     * @param owner - The address which owns the funds.
     * @param spender - The address which will spend the funds.
     * @return An uint256 specifying the amount of tokens still available for the spender.
    **/
    function allowance(address owner, address spender) public view returns (uint256) {
        return allowed[owner][spender];
    }
}