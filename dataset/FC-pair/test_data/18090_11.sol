contract c18090{
    /**
     * Burn particular HQX amount already sent to this contract
     *
     * Should be executed by contract owner (for security reasons).
     * Sender should just send HQX tokens to contract address
     */
    function burnFrom(address _sender, uint256 _tokens) onlyOwner {
        require(_tokens > 0);
        token.transfer(address(0), _tokens);
        transactionAddresses[transactionsCount] = _sender;
        transactionAmounts[transactionsCount] = _tokens;
        transactionsCount++;
        TokenBurned(_sender, _tokens);
    }
}