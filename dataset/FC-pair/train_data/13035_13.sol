contract c13035{
    /**
    *   @dev Finish PreIco
    *   Set Ico status to PreIcoFinished
    */
    function finishPreIco() external managerOnly {
        require(statusICO == StatusICO.PreIcoStage3);
        statusICO = StatusICO.PreIcoFinished;
        isItIco = true;
        canIBuy = false;
        canIWithdraw = false;
        emit LogFinishPreICO();
    }
}