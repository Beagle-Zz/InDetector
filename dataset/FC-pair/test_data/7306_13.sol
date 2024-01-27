contract c7306{
    //get lockPosition info
    function getLockPosition(address _add) public view returns(uint time,uint count,uint rate,uint scount,uint _lockTime) {
        return (lposition[_add].time,lposition[_add].count,lposition[_add].releaseRate,positionScount(_add),lposition[_add].lockTime);
    }
}