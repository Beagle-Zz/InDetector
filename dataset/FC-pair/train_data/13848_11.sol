contract c13848{
    /**
     * ERC20 interface.
     */
    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param holder The address which owns the funds.
     * @param spender The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address holder, address spender) public view returns (uint256 remaining) {
        return allowed[holder][spender];
    }
}