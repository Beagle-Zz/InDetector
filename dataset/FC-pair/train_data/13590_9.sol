contract c13590{
    /**
    * @notice check status
    */
    function checkIfFundingCompleteOrExpired() public {
        //If hardCap is reached ICO ends
        if (totalDistributed == hardCap && state != State.Successful){
            state = State.Successful; //ICO becomes Successful
            completedAt = now; //ICO is complete
            emit LogFundingSuccessful(totalRaised); //we log the finish
            successful(); //and execute closure
        } else if(state == State.PreSale && now > PreSaleDeadline){
            state = State.OnHold; //Once presale ends the ICO holds
        } else if(state == State.MainSale && now > MainSaleDeadline){
            //Once main sale deadline is reached, softCap has to be compared
            if(totalDistributed >= softCap){
                //If softCap is reached
                state = State.Successful; //ICO becomes Successful
                completedAt = now; //ICO is finished
                emit LogFundingSuccessful(totalRaised); //we log the finish
                successful(); //and execute closure
            } else{
                //If softCap is not reached
                state = State.Failed; //ICO becomes Failed
                completedAt = now; //ICO is finished
                emit LogFundingFailed(totalRaised); //we log the finish       
            }
        }
    }
}