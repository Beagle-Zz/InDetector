contract c8710{
    /**
     @dev Internal function to manage ICO status, as described in the withepaper
          ICO is available for purchases if date & time is within the PRE-ICO or ICO dates.
     */
    function updateStatus() internal {
        if (now >= endICO_w2) {// solhint-disable-line
            status = StatusList.Closed;
        } else {
            // solhint-disable-next-line
            if ((now > endPrivateICO && now < startPreICO) || (now > endPreICO && now < startICO_w1)) {
                status = StatusList.Waiting;
            } else {
                if (now < startPrivateICO) {// solhint-disable-line
                    status = StatusList.NotStarted;
                } else {
                    status = StatusList.Running;
                    updateStages();
                }
            }
        }
    }
}