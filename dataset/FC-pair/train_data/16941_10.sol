contract c16941{
//// Withdraw and distribute winnings
    function withdrawWinnings() external payable
            onlyProxy
    {
        if ((msg.value > expectedReturn) && !emergencyBlock) {
            emit BetResult(roundID, 1, msg.value); // We won! Set 1
            distributeWinnings(msg.value);
        } else {
            emit BetResult(roundID, 0, msg.value); // We lost :( Set 0
        }
        numberOfBets = 0;
        betsState = true;
        roundID++;
    }
}