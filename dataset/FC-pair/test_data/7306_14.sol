contract c7306{
    //set lock position
    function setLockPostion1(address _add,uint _count,uint8 _typ,uint _time1,uint8 _releaseRate1,uint _time2,uint8 _releaseRate2,uint _time3,uint8 _releaseRate3,uint _time4,uint8 _releaseRate4) public is_not_locked(_add) onlyOwner {
        require(_count > 0);
        require(_time1 > now);
        require(_releaseRate1 > 0);
        require(_typ >= 1 && _typ <= 4);
        require(balances[_add] >= safeMul(_count,10**uint(decimals)));
        require(safeAdd(safeAdd(_releaseRate1,_releaseRate2),safeAdd(_releaseRate3,_releaseRate4)) == 100);
        require(lposition[_add].count == 0);
        if(_typ == 1){
            require(_time2 == 0 && _releaseRate2 == 0 && _time3 == 0 && _releaseRate3 == 0 && _releaseRate4 == 0 && _time4 == 0);
        }
        if(_typ == 2){
            require(_time2 > _time1 && _releaseRate2 > 0 && _time3 == 0 && _releaseRate3 == 0 && _releaseRate4 == 0 && _time4 == 0);
        }
        if(_typ == 3){
            require(_time2 > _time1 && _releaseRate2 > 0 && _time3 > _time2 && _releaseRate3 > 0 && _releaseRate4 == 0 && _time4 == 0);
        }
        if(_typ == 4){
            require(_time2 > _time1 && _releaseRate2 > 0 && _releaseRate3 > 0 && _time3 > _time2 && _time4 > _time3 && _releaseRate4 > 0);
        }
        lockPostion1Add(_typ,_add,_count,_time1,_releaseRate1,_time2,_releaseRate2,_time3,_releaseRate3,_time4,_releaseRate4);
    }
}