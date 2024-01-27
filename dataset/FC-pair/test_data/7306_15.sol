contract c7306{
    //get lockPosition1 info
    function getLockPosition1(address _add) public view returns(uint count,uint Scount,uint8 _typ,uint8 _rate1,uint8 _rate2,uint8 _rate3,uint8 _rate4) {
        return (lposition1[_add].count,positionScount1(_add),lposition1[_add].typ,lposition1[_add].releaseRate1,lposition1[_add].releaseRate2,lposition1[_add].releaseRate3,lposition1[_add].releaseRate4);
    }
}