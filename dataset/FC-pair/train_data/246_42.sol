contract c246{
    /** @dev Deposit tokens in order to have chances of being drawn. Note that once tokens are deposited, 
     *  there is no possibility of depositing more.
     *  @param _value Amount of tokens (in basic units) to deposit.
     */
    function activateTokens(uint _value) public onlyDuring(Period.Activation) {
        Juror storage juror = jurors[msg.sender];
        require(_value <= juror.balance);
        require(_value >= minActivatedToken);
        require(juror.lastSession != session); // Verify that tokens were not already activated for this session.
        juror.lastSession = session;
        juror.segmentStart = segmentSize;
        segmentSize += _value;
        juror.segmentEnd = segmentSize;
    }
}