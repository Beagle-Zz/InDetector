contract c18945{
    //
    //  This is the main function. It is called to buy a kingdom
    //
    function purchaseKingdom(string _key, string _title, bool _locked) public 
    payable 
    nonReentrant()
    checkKingdomExistence(_key)
    checkIsNotLocked(_key)
    {
        require(now < rounds[currentRound].endTime);
        Round storage round = rounds[currentRound];
        uint kingdomId = round.kingdomsKeys[_key];
        Kingdom storage kingdom = kingdoms[kingdomId];
        require((kingdom.kingdomTier + 1) < 6);
        uint requiredPrice = kingdom.minimumPrice;
        if (_locked == true) {
            requiredPrice = requiredPrice.add(ACTION_TAX);
        }
        require (msg.value >= requiredPrice);
        uint jackpotCommission = (msg.value).sub(kingdom.returnPrice);
        if (kingdom.returnPrice > 0) {
            round.nbKingdoms[kingdom.owner]--;
            if (kingdom.kingdomType == 1) {
                round.nbKingdomsType1[kingdom.owner]--;
            } else if (kingdom.kingdomType == 2) {
                round.nbKingdomsType2[kingdom.owner]--;
            } else if (kingdom.kingdomType == 3) {
                round.nbKingdomsType3[kingdom.owner]--;
            } else if (kingdom.kingdomType == 4) {
                round.nbKingdomsType4[kingdom.owner]--;
            } else if (kingdom.kingdomType == 5) {
                round.nbKingdomsType5[kingdom.owner]--;
            }
            compensateLatestMonarch(kingdom.lastTransaction, kingdom.returnPrice);
        }
        uint jackpotSplitted = jackpotCommission.mul(50).div(100);
        round.globalJackpot.balance = round.globalJackpot.balance.add(jackpotSplitted);
        kingdom.kingdomTier++;
        kingdom.title = _title;
        if (kingdom.kingdomTier == 5) {
            kingdom.returnPrice = 0;
        } else {
            kingdom.returnPrice = kingdom.minimumPrice.mul(2);
            kingdom.minimumPrice = kingdom.minimumPrice.add(kingdom.minimumPrice.mul(2));
        }
        kingdom.owner = msg.sender;
        kingdom.locked = _locked;
        uint transactionId = kingdomTransactions.push(Transaction("", msg.sender, msg.value, 0, jackpotSplitted)) - 1;
        kingdomTransactions[transactionId].kingdomKey = _key;
        kingdom.transactionCount++;
        kingdom.lastTransaction = transactionId;
        setNewJackpot(kingdom.kingdomType, jackpotSplitted, msg.sender);
        LandPurchasedEvent(_key, msg.sender);
    }
}