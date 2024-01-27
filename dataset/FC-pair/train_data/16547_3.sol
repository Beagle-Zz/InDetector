contract c16547{
    /**
    * @notice check status
    */
    function checkIfFundingCompleteOrExpired() public {
        if (now > deadline && state != State.Successful) {
            state = State.Successful;
            //Sale becomes Successful
            completedAt = now;
            //ICO finished
            emit LogFundingSuccessful(totalRaised);
            //we log the finish
            finished();
        } else if (state == State.Stage1 && now >= startStage2Time) {
            state = State.Stage2;
        }
    }
}