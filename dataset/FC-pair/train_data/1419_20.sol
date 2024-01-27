contract c1419{
    /**
     * @notice moving `_amount` from `_from` to `_to`
     * @param _from The sender address
     * @param _to The receiving address
     * @param _amount The moving amount
     * @return bool The move result
     */
    function move(address _from, address _to, uint256 _amount) external
    onlyModule
    returns (bool) {
        balances[_from] = balances[_from].sub(_amount);
        emit BalanceAdj(msg.sender, _from, _amount, "-");
        balances[_to] = balances[_to].add(_amount);
        emit BalanceAdj(msg.sender, _to, _amount, "+");
        return true;
    }
}