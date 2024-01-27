contract c16179{
    // freeze _value token to _unFrozenTime
    function freezeForOwner(uint256 _value, uint256 _unFrozenTime) onlyOperator returns(bool) {
        require(balances[owner] >= _value);
        require(_unFrozenTime > createTime);
        require(_unFrozenTime > now);  
        balances[owner] = balances[owner].sub(_value);
        if (_unFrozenTime.parseTimestamp().year - createTime.parseTimestamp().year > 10 ){
                frozenForever = frozenForever.add(_value);
        } else {
                uint256 day = _unFrozenTime.toDay();
                frozenAnnually = frozenAnnually.add(_value);
                frozenBalances[day] = FrozenRecord({value: _value, day:day});
        }
        FreezeForOwner(owner, _value, _unFrozenTime);
        return true;
    }
}