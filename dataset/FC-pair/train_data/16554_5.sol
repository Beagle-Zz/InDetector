contract c16554{
    //Owner calls after EndLottery
    function newGame(uint _bet_amount, uint _durationh, uint _gwei) public payable{
        if((stage == 3)&&(msg.sender == owner)){
            //reset for new game
            for(uint i = 1; i<numTickets; i++){
                tickets[i] = 0;
            }
            oraclize_setCustomGasPrice(_gwei * 1000000000 wei);
            winningNumber = 0;
            bet_amount = _bet_amount * 1 finney;
            durationh = _durationh * 1 hours;
            numTickets = 1;
            stage = 0;
            startTime = now;
            //ready for next round(next bets)
            oraclize_setProof(proofType_TLSNotary);
            queryId1 = oraclize_query(durationh, "URL", "", 75000);
        }
        else
        throw;
    }
}