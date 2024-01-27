contract c2529{
    //internal function to pay out the winner
    function _payoutWinner(uint winner, uint loser, uint take, uint fee) private returns(bool) {
        BigBankBet(block.number, betBanks[winner].owner, betBanks[loser].owner, winner, loser, take.sub(fee));//broadcast the BigBankBet event
        address winnerAddr = betBanks[winner].owner;//save the winner address
        _endBetListing(winner);//end the token
        _endBetListing(loser);//end the token
        userBank[winnerAddr] = (userBank[winnerAddr]).add(take.sub(fee));//pay out the winner
        return true;
    }
}