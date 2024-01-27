contract c18278{
    // Tap poll
    function createTapPoll(uint8 tapIncPerc) public onlyOwner {
        require(state == FundState.TeamWithdraw);
        require(tapPoll == address(0));
        require(getDay(now) == 1);
        require(tapIncPerc <= 100);
        uint256 _tap = safeAdd(tap, safeDiv(safeMul(tap, tapIncPerc), 50));
        uint256 startTime = now;
        uint256 endTime = startTime + TAP_POLL_DURATION;
        tapPoll = new TapPoll(_tap, token, this, startTime, endTime, minVotedTokensPerc);
        TapPollCreated();
    }
}