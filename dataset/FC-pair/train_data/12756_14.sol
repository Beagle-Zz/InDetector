contract c12756{
    // Sender interface
    /**
     * @dev exchange amount of this token to target token
     * @param _targetContract target token contract
     * @param _amount amount of tokens to exchange
     * @return (true, creditedAmount) on success.
     *          (false, 0) on:
     *              nothing =)
     *          revert on:
     *              exchangeToken in exchange contract return (false, 0)
     *              exchange address is not configured
     *              balance of tokens less then amount to exchange
     */
    function exchangeToken(address _targetContract, uint _amount) public whenConfigured returns (bool success, uint creditedAmount) {
        require(_targetContract != address(0) && _amount <= balances[msg.sender]);
        (success, creditedAmount) = exchange.exchangeToken(_targetContract, _amount);
        if (!success) {
            revert();
        }
        emit Exchange(msg.sender, _targetContract, _amount);
        return (success, creditedAmount);
    }
}