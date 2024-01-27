contract c3575{
    /**
     * @dev Internal function that this reused by the transfer functions
     */
    function executeTransfer(address _from, address _to, uint256 _value) internal {
        require(_to != address(0));
        require(_value != 0 && _value <= balances[_from]);
        balances[_from] = balances[_from].minus(_value);
        balances[_to] = balances[_to].plus(_value);
        emit Transfer(_from, _to, _value);
    }
}