contract c13033{
   /**
    *   
    *   Set PreICO status
    */
    function setPreIcoStatus(uint _numb) external managerOnly {
        require(statusICO == StatusICO.Created 
        || statusICO == StatusICO.PreIcoStage1 
        || statusICO == StatusICO.PreIcoStage2); 
        require(_numb == 1 ||  _numb == 2 || _numb == 3);
        StatusICO stat = StatusICO.PreIcoStage1;
        if(_numb == 2){stat = StatusICO.PreIcoStage2;}
        else if(_numb == 3){stat = StatusICO.PreIcoStage3;}
        statusICO = stat;
        canIBuy = true;
        canIWithdraw = true;
        emit LogStartPreIcoStage(_numb);
    }
}