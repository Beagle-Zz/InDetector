contract c10123{
    // ** Internal Token Handling - validation completed by callers **
    function _allocatePlayerTokensTo(address _to, uint256 _amount) internal {
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Transfer(address(0), _to, _amount);
    }
}