contract c13035{
   /**
    *   @dev Start ICO
    *   Set ICO status
    */
    function setIcoStatus(uint _numb) external managerOnly {
        require(statusICO == StatusICO.PreIcoFinished 
        || statusICO == StatusICO.IcoStage1 
        || statusICO == StatusICO.IcoStage2 
        || statusICO == StatusICO.IcoStage3 
        || statusICO == StatusICO.IcoStage4);
        require(_numb == 1 ||  _numb == 2 || _numb == 3 || _numb == 4 || _numb == 5);
        StatusICO stat = StatusICO.IcoStage1;
        if(_numb == 2){stat = StatusICO.IcoStage2;}
        else if(_numb == 3){stat = StatusICO.IcoStage3;}
        else if(_numb == 4){stat = StatusICO.IcoStage4;}
        else if(_numb == 5){stat = StatusICO.IcoStage5;}
        statusICO = stat;
        canIBuy = true;
        canIWithdraw = true;
        emit LogStartIcoStage(_numb);
    }
}