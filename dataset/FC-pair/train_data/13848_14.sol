contract c13848{
    /**
     * StandardToken interface.
     */
    /**
     * @dev Decrease the amount of tokens that an owner allowed to a spender.
     * @param spender The address which will spend the funds.
     * @param amount The amount of token to be decreased, in fraction units.
     * @return A boolean that indicates if the operation was successful.
     */
    function decreaseApproval(address spender, uint256 amount) public returns (bool success) {
        uint256 oldValue = allowed[msg.sender][spender];
        if (amount > oldValue) {
            allowed[msg.sender][spender] = 0;
        } else {
            allowed[msg.sender][spender] = oldValue.sub(amount);
        }
        Approval(msg.sender, spender, allowed[msg.sender][spender]);
        return true;
    }
}