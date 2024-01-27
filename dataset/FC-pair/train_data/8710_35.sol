contract c8710{
    /**
     @dev Internal function to manage ICO status when tokens are sold out.
          ICO has a number of limmited tokens to be sold within PrivateICO, PRE-ICO and ICO stages,
          this method changes status to WaitingICO if PRE-ICO tokens are sold out or
          Closed when ICO tokens are sold out.
     */
    function updateStatusViaTokens() internal {
        availableICO = tokenReward.balanceOf(this);
        if (availablePrivateICO == 0 && stage == StagesList.PrivateICO) status = StatusList.Waiting;
        if (availablePreICO == 0 && stage == StagesList.PreICO) status = StatusList.Waiting;
        if (availableICO_w1 == 0 && stage == StagesList.ICO_w1) status = StatusList.Waiting;
        if (availableICO_w2 == 0 && stage == StagesList.ICO_w2) status = StatusList.Waiting;
        if (availableICO == 0) status = StatusList.Closed;
    }
}