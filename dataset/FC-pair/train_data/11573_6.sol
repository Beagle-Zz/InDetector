contract c11573{
    /**
     * @notice Transfer tokens from an address to another one
     * through an allowance made before
     * @dev This function is part of the ERC20 standard
     * @param from The address that sends the tokens
     * @param to The address that receives the tokens
     * @param tokenAmount Token amount to transfer
     * @return {"success": "If the operation completed successfuly"}
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenAmount
    )
        public returns (bool success)
    {
        balances[from] = balances[from].sub(tokenAmount);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokenAmount);
        balances[to] = balances[to].add(tokenAmount);
        emit Transfer(from, to, tokenAmount);
        return true;
    }
}