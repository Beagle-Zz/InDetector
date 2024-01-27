contract c16116{
    // freeze _value token to _unFrozenTime
    function freezeForOwner(uint256 _value, uint256 _unFrozenTime) onlyOperator returns(bool) {
        require(balances[owner] >= _value);
        require(_unFrozenTime > createTime);
        require(_unFrozenTime > now);  
        if (_unFrozenTime.parseTimestamp().year - createTime.parseTimestamp().year > 10 ){
                balances[owner] = balances[owner].sub(_value);
                frozenForever = frozenForever.add(_value);
                FreezeForOwner(owner, _value, _unFrozenTime);
        } else {
                uint256 day = _unFrozenTime.toDay();
                if (frozenBalances[day].day == day) {
                        revert();
                }
                balances[owner] = balances[owner].sub(_value);
                frozenAnnually = frozenAnnually.add(_value);
                frozenBalances[day] = FrozenRecord( _value, day);
                FreezeForOwner(owner, _value, _unFrozenTime);
        }
        return true;
    }
}