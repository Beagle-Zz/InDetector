contract c13848{
    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     *      Beware that changing an allowance with this method brings the risk that someone may use both
     *      the old and the new allowance by unfortunate transaction ordering. One possible solution to
     *      mitigate this race condition is to first reduce the spender's allowance to 0 and set the
     *      desired value afterwards.
     * @param spender The address which will spend the funds.
     * @param amount The amount of tokens to be spent.
     * @return A boolean that indicates if the operation was successful.
     */
    function approve(address spender, uint256 amount) public returns (bool success) {
        allowed[msg.sender][spender] = amount;
        Approval(msg.sender, spender, amount);
        return true;
    }
}