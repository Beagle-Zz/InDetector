contract c13432{
    /**
     * @notice Permits to create an approval on a contract and then call a method
     * on the approved contract right away.
     * @param spender The allowed address
     * @param tokenAmount The maximum amount allowed to spend
     * @param data The data sent back as parameter to the contract (bytes array)
     * @return {"success": "If the operation completed successfuly"}
     */
    function approveAndCall(
        address spender,
        uint256 tokenAmount,
        bytes data
    )
        public tradable(spender) returns (bool success)
    {
        allowed[msg.sender][spender] = tokenAmount;
        emit Approval(msg.sender, spender, tokenAmount);
        ApproveAndCallFallBack(spender)
            .receiveApproval(msg.sender, tokenAmount, this, data);
        return true;
    }
}