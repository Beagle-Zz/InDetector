contract c12756{
    // Receiver interface
    /**
     * @dev receive amount of tokens from exchange. Must be called only from exchange contract
     * @param _amount amount of tokens to receive
     * @return true on success.
     *          false on:
     *              nothing =)
     *          revert on:
     *              exchange address is not configured
     *              called not by configured exchange address
     */
    function __targetExchangeCallback(uint _amount) public whenConfigured onlyExchange returns (bool success) {
        balances[tx.origin] = balances[tx.origin].add(_amount);
        exchangesReceived[tx.origin] = exchangesReceived[tx.origin].add(_amount);
        emit Exchange(tx.origin, this, _amount);
        return true;
    }
}