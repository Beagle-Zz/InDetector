contract c8911{
    /// @dev Issue token based on Ether received.
    /// @param recipient Address that newly issued token will be sent to.
    function issueToken(address recipient) payable inProgress {
        // We only accept minimum purchase of 0.01 ETH.
        assert(msg.value >= 0.01 ether);
        uint tokens = computeTokenAmount(msg.value);
        totalEthReceived = totalEthReceived.add(msg.value);
        totalSupply = totalSupply.add(tokens);
        balances[recipient] = balances[recipient].add(tokens);
        Issue(
            issueIndex++,
            recipient,
            msg.value,
            tokens
        );
        if (!target.send(msg.value)) {
            throw;
        }
    }
}