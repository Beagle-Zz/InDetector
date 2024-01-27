contract c4347{
    //Lock tokens
    function canTransfer(address _from, uint256 _value) internal view returns (bool success) {
        uint256 index;  
        uint256 locked;
        index = safeSub(now, updateTime[_from]) / 1 days;
        if(index >= 200){
            return true;
        }
        uint256 releasedtemp = safeMul(index,jail[_from])/200;
        if(releasedtemp >= LockedToken[_from]){
            return true;
        }
        locked = safeSub(LockedToken[_from],releasedtemp);
        require(safeSub(balances[_from], _value) >= locked);
        return true;
    }
}