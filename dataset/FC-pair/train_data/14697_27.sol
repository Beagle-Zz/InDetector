contract c14697{
    /// @dev Transfers tokens to a given address
    /// @param to Address of token receiver
    /// @param value Number of tokens to transfer
    function withdraw(address to, uint256 value)
        public
    {
        uint256 maxTokens = calcMaxWithdraw();
        uint256 withdrawAmount = value < maxTokens ? value : maxTokens;
        withdrawnTokens[msg.sender] = SafeMath.add(withdrawnTokens[msg.sender], withdrawAmount);
        token.transfer(to, withdrawAmount);
        LogWithdraw(to, value);
    }
}