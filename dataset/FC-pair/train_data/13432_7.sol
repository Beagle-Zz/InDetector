contract c13432{
    /**
     * @notice Transfers `amount` from msg.sender to `destination`
     * @dev This function is part of the ERC20 standard
     * @param destination The address that receives the tokens
     * @param amount Token amount to transfer
     * @return {"success": "If the operation completed successfuly"}
     */
    function transfer(
        address destination,
        uint256 amount
    )
        public tradable(msg.sender) returns (bool success)
    {
        balances[msg.sender] = balances[msg.sender].sub(amount);
        balances[destination] = balances[destination].add(amount);
        emit Transfer(msg.sender, destination, amount);
        return true;
    }
}