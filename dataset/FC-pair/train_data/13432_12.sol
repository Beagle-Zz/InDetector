contract c13432{
    /**
     * @notice Permits to withdraw any ERC20 tokens that have been mistakingly sent to this contract
     * @param tokenAddress The received ERC20 token address
     * @param tokenAmount The amount of ERC20 tokens to withdraw from this contract
     * @return {"success": "If the operation completed successfuly"}
     */
    function withdrawERC20Token(
        address tokenAddress,
        uint256 tokenAmount
    )
        public onlyOwner returns (bool success)
    {
        return ERC20Interface(tokenAddress).transfer(owner, tokenAmount);
    }
}