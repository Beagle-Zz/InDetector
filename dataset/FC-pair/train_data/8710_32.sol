contract c8710{
    /**
     @dev PRE-ICO and ICO times can be changed with this function by the owner if ICO has not started.
    *     This function changes startTimestamp time with _startingTime given.
     @param     _startPrivateICO contains new starting date for PRE-ICO
     @param     _endPrivateICO contains new ending date for PRE-ICO
     @param     _startPreICO contains new starting date for ICO
     @param     _endPreICO contains new ending date for ICO
     @param     _startICO_w1 contains new starting date for PRE-ICO
     @param     _endICO_w1 contains new ending date for PRE-ICO
     @param     _startICO_w2 contains new starting date for ICO
     @param     _endICO_w2 contains new ending date for ICO
    */
    function setNewICOTime(
    uint _startPrivateICO,
    uint _endPrivateICO,
    uint _startPreICO,
    uint _endPreICO,
    uint _startICO_w1,
    uint _endICO_w1,
    uint _startICO_w2,
    uint _endICO_w2
    )
    public
    onlyOwner onlyInState(StatusList.NotStarted) {
        require(now < startPrivateICO && startPrivateICO < endPrivateICO && startPreICO < endPreICO && startICO_w1 < endICO_w1 && startICO_w2 < endICO_w2); // solhint-disable-line
        startPrivateICO = _startPrivateICO;
        endPrivateICO = _endPrivateICO;
        startPreICO = _startPreICO;
        endPreICO = _endPreICO;
        startICO_w1 = _startICO_w1;
        endICO_w1 = _endICO_w1;
        startICO_w2 = _startICO_w2;
        endICO_w2 = _endICO_w2;
    }
}