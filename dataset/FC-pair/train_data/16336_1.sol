contract c16336{
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
        // woodInterface.resetTimer(_key);
        kingdom.kingdomTier++;
        kingdom.title = _title;
        if (kingdom.kingdomTier == 5) {
            kingdom.returnPrice = 0;
            kingdom.minimumPrice = 5 ether;
        } else if (kingdom.kingdomTier == 2) {
            kingdom.returnPrice = 0.1125 ether;
            kingdom.minimumPrice = 0.27 ether;
        } else if (kingdom.kingdomTier == 3) {
            kingdom.returnPrice = 0.3375 ether;
            kingdom.minimumPrice = 0.81 ether;
        } else if (kingdom.kingdomTier == 4) {
            kingdom.returnPrice = 1.0125 ether;
            kingdom.minimumPrice = 2.43 ether;
        }
        kingdom.owner = msg.sender;
        kingdom.locked = _locked;
        uint transactionId = kingdomTransactions.push(Transaction("", msg.sender, msg.value, 0, jackpotCommission, now)) - 1;
        kingdomTransactions[transactionId].kingdomKey = _key;
        kingdom.transactionCount++;
        kingdom.lastTransaction = transactionId;
        lastTransaction[msg.sender] = now;
        setNewJackpot(kingdom.kingdomType, jackpotCommission, msg.sender);
        LandPurchasedEvent(_key, msg.sender);
    }
}