contract c16603{
    /**
    * @notice check status
    */
    function checkIfFundingCompleteOrExpired() public {
        if(now > deadline){
            state = State.Successful; //TGE becomes Successful
            completedAt = now; //TGE end time
            emit LogFundingSuccessful(totalRaised); //we log the finish
            finished(); //and execute closure
        }
    }
}