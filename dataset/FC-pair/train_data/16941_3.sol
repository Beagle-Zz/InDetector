contract c16941{
//// Sending bets and withdrawing winnings
    function sendToEtheroll(uint rollUnder, uint newRoundID) external payable
            onlyMicro
    {
        roundID = newRoundID;
        Etheroll e = Etheroll(etheroll);
        e.playerRollDice.value(msg.value)(rollUnder);
        emit SentFunds(roundID, msg.value, rollUnder);
    }
}