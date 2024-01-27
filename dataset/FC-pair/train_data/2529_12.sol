contract c2529{
    //bet a users token against another users token
    function betAgainstUser(uint _betId1, uint _betId2) public defcon3 returns(bool){
        require(betBanks[_betId1].bet != emptyBet && betBanks[_betId2].bet != emptyBet);//require that both tokens are active and hold funds
        require(betBanks[_betId1].owner == msg.sender || betBanks[_betId2].owner == msg.sender); //require that the user submitting is the owner of one of the tokens
        require(betBanks[_betId1].owner != betBanks[_betId2].owner);//prevent a user from betting 2 tokens he owns, prevent possible exploits
        require(_betId1 != _betId2);//require that user doesn't bet token against itself
        //unhash the bets to calculate winner
        uint bet1ConvertedAddr = uint(betBanks[_betId1].owner);
        uint bet1 = (uint(betBanks[_betId1].bet)/7).sub(bet1ConvertedAddr);
        uint bet2ConvertedAddr = uint(betBanks[_betId2].owner);
        uint bet2 = (uint(betBanks[_betId2].bet)/7).sub(bet2ConvertedAddr);  
        uint take = (bet1).add(bet2);//calculate the total rewards for winning
        uint fee = (take.mul(houseFee)).div(100);//calculate the fee
        houseCommission = houseCommission.add(fee);//add fee to commission
        if(bet1 != bet2) {//if no tie
            if(bet1 > bet2) {//if betId1 wins
                _payoutWinner(_betId1, _betId2, take, fee);//payout betId1
            } else {
                _payoutWinner(_betId2, _betId1, take, fee);//payout betId2
            }
        } else {//if its a tie
            if(_random() == 0) {//choose a random winner
                _payoutWinner(_betId1, _betId2, take, fee);//payout betId1
            } else {
                _payoutWinner(_betId2, _betId1, take, fee);//payout betId2
            }
        }
        return true;
    }
}