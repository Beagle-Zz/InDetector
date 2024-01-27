contract c13432{
    /**
     * @notice Get the remaining allowance for a spender on a given address
     * @dev This function is part of the ERC20 standard
     * @param tokenOwner The address that owns the tokens
     * @param spender The spender
     * @return {"remaining": "The amount of tokens remaining in the allowance"}
     */
    function allowance(
        address tokenOwner,
        address spender
    )
        public view returns (uint256 remaining)
    {
        return allowed[tokenOwner][spender];
    }
}