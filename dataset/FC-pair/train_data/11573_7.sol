contract c11573{
    /**
     * @notice Approve an address to send `tokenAmount` tokens to `msg.sender` (make an allowance)
     * @dev This function is part of the ERC20 standard
     * @param spender The allowed address
     * @param tokenAmount The maximum amount allowed to spend
     * @return {"success": "If the operation completed successfuly"}
     */
    function approve(
        address spender,
        uint256 tokenAmount
    )
        public returns (bool success)
    {
        allowed[msg.sender][spender] = tokenAmount;
        emit Approval(msg.sender, spender, tokenAmount);
        return true;
    }
}