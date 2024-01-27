contract c18945{
    //
    //  After time expiration, owner can call this function to activate the next round of the game
    //
    function activateNextRound() public checkIsClosed() {
        Round storage finishedRound = rounds[currentRound];
        require(finishedRound.globalJackpot.balance == 0);
        require(finishedRound.jackpot5.balance == 0);
        require(finishedRound.jackpot4.balance == 0);
        require(finishedRound.jackpot3.balance == 0);
        require(finishedRound.jackpot2.balance == 0);
        require(finishedRound.jackpot1.balance == 0);
        currentRound++;
        rounds[currentRound] = Round(Jackpot(address(0), 0), Jackpot(address(0), 0), Jackpot(address(0), 0), Jackpot(address(0), 0), Jackpot(address(0), 0), Jackpot(address(0), 0), 0, 0);
        rounds[currentRound].startTime = now;
        rounds[currentRound].endTime = now + 7 days;
        delete kingdoms;
        delete kingdomTransactions;
    }
}