contract c12756{
    /**
     * @dev send amount of this token to exchange. Must be called only from exchange contract
     * @param _targetContract target token contract
     * @param _exchanger address of user, who exchange tokens
     * @param _amount amount of tokens to exchange
     * @return true on success.
     *          false on:
     *              balance of tokens less then amount to exchange
     *          revert on:
     *              exchange address is not configured
     *              called not by configured exchange address
     */
    function __exchangerCallback(address _targetContract, address _exchanger, uint _amount) public whenConfigured onlyExchange returns (bool success) {
        require(_targetContract != address(0));
        if (_amount > balances[_exchanger]) {
            return false;
        }
        balances[_exchanger] = balances[_exchanger].sub(_amount);
        exchangedWith[_targetContract] = exchangedWith[_targetContract].add(_amount);
        exchangedBy[_exchanger] = exchangedBy[_exchanger].add(_amount);
        return true;
    }
}