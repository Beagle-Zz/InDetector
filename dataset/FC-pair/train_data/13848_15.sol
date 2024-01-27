contract c13848{
    /**
     * @dev Increase the amount of tokens that an owner allowed to a spender.
     *      approve should be called when allowance(owner, spender) == 0. To
     *      increment allowed value is better to use this function to avoid 2
     *      calls (and wait until the first transaction is mined).
     * @param spender The address which will spend the funds.
     * @param amount The amount of token to be increased, in fraction units.
     * @return A boolean that indicates if the operation was successful.
     */
    function increaseApproval(address spender, uint amount) public returns (bool success) {
        allowed[msg.sender][spender] = allowed[msg.sender][spender].add(amount);
        Approval(msg.sender, spender, allowed[msg.sender][spender]);
        return true;
    }
}