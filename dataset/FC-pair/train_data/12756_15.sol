contract c12756{
    /**
     * @dev exchange amount of this token to target token and transfer to specified address
     * @param _targetContract target token contract
     * @param _amount amount of tokens to exchange
     * @param _to address for transferring exchanged tokens
     * @return true on success.
     *          false on:
     *              nothing =)
     *          revert on:
     *              exchangeTokenAndSpend in exchange contract return false
     *              exchange address is not configured
     *              balance of tokens less then amount to exchange
     */
    function exchangeAndSpend(address _targetContract, uint _amount, address _to) public whenConfigured returns (bool success) {
        require(_targetContract != address(0) && _to != address(0) && _amount <= balances[msg.sender]);
        success = exchange.exchangeAndSpend(_targetContract, _amount, _to);
        if (!success) {
            revert();
        }
        emit ExchangeSpent(msg.sender, _targetContract, _to, _amount);
        return success;
    }
}