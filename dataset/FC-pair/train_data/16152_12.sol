contract c16152{
    // method to calculate an invidual's reward
    function calculateReward(address candidate) internal afterRace constant returns(uint winner_reward) {
        voter_info storage bettor = voterIndex[candidate];
        if(chronus.voided_bet) {
            winner_reward = bettor.total_bet;
        } else {
            uint winning_bet_total;
            if(winner_horse[horses.BTC]) {
                winning_bet_total += bettor.bets[horses.BTC];
            } if(winner_horse[horses.ETH]) {
                winning_bet_total += bettor.bets[horses.ETH];
            } if(winner_horse[horses.LTC]) {
                winning_bet_total += bettor.bets[horses.LTC];
            }
            winner_reward += (((total_reward.mul(10000000)).div(winnerPoolTotal)).mul(winning_bet_total)).div(10000000);
        } 
    }
}