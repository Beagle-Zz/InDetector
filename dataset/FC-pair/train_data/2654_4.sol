contract c2654{
    //
    // _amount, _freezeAmount in BioX
    //
    function  freezeDeliver(address _to, uint _amount, uint _freezeAmount, uint _freezeMonth, uint _unfreezeBeginTime ) onlyOwner public {
        require(owner != _to);
        require(_freezeMonth > 0);
        uint average = _freezeAmount / _freezeMonth;
        BalanceInfo storage bi = balances[_to];
        uint[] memory fa = new uint[](_freezeMonth);
        uint[] memory rt = new uint[](_freezeMonth);
        if(_amount < bioxSupply){
            _amount = _amount * bioxEthRate;
            average = average * bioxEthRate;
            _freezeAmount = _freezeAmount * bioxEthRate;
        }
        require(balances[owner].balance > _amount);
        uint remainAmount = _freezeAmount;
        if(_unfreezeBeginTime == 0)
            _unfreezeBeginTime = now + freezeDuration;
        for(uint i=0;i<_freezeMonth-1;i++){
            fa[i] = average;
            rt[i] = _unfreezeBeginTime;
            _unfreezeBeginTime += freezeDuration;
            remainAmount = remainAmount.sub(average);
        }
        fa[i] = remainAmount;
        rt[i] = _unfreezeBeginTime;
        bi.balance = bi.balance.add(_amount);
        bi.freezeAmount = fa;
        bi.releaseTime = rt;
        balances[owner].balance = balances[owner].balance.sub(_amount);
        emit Transfer(owner, _to, _amount);
        emit Freeze(_to, _freezeAmount);
    }
}