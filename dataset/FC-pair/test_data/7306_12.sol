contract c7306{
    //set lock position
    function setLockPostion(address _add,uint _count,uint _time,uint _releaseRate,uint _lockTime) public is_not_locked(_add) onlyOwner {
        require(lposition1[_add].count == 0);
        require(balances[_add] >= safeMul(_count,10**uint(decimals)));
        require(_time > now);
        require(_count > 0 && _lockTime > 0);
        require(_releaseRate > 0 && _releaseRate < 100);
        require(_releaseRate == 2 || _releaseRate == 4 || _releaseRate == 5 || _releaseRate == 10 || _releaseRate == 20 || _releaseRate == 25 || _releaseRate == 50);
        lposition[_add].time = _time;
        lposition[_add].count = _count * 10**uint(decimals);
        lposition[_add].releaseRate = _releaseRate;
        lposition[_add].lockTime = _lockTime;
    }
}