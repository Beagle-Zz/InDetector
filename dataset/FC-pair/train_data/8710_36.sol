contract c8710{
    /**
     @dev Internal function to manage ICO stages.
          Stage is used in order to calculate the proper token price.
     */
    function updateStages() internal onlyInState(StatusList.Running) {
        if (now <= endPrivateICO && now > startPrivateICO) { stage = StagesList.PrivateICO; return;}// solhint-disable-line
        if (now <= endPreICO && now > startPreICO) { stage = StagesList.PreICO; return;}// solhint-disable-line
        if (now <= endICO_w1 && now > startICO_w1) { stage = StagesList.ICO_w1; return;}// solhint-disable-line
        if (now <= endICO_w2 && now > startICO_w2) { stage = StagesList.ICO_w2; return;}// solhint-disable-lin
        stage = StagesList.N_A;
    }
}