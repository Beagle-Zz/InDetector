contract c16179{
    // unfreeze frozen amount
    function unfreeze(uint256 _unFrozenTime) onlyOperator returns (bool) {
        require(_unFrozenTime < block.timestamp);
        uint256 day = _unFrozenTime.toDay();
        uint256 _value = frozenBalances[day].value;
        if (_value>0) {
                frozenBalances[day].value = 0;
                frozenAnnually = frozenAnnually.sub(_value);
                balances[owner] = balances[owner].add(_value);
                Unfreeze(owner, _value);
        }
        return true;
    }
}