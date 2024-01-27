contract c3378{
    // This function is being called when a user presses the button on the website (or call it directly from the contract)
    function Press(uint _countPresses, uint _affId) public payable {
        // We verify that the _countPress value is not < 1
        require(_countPresses >= 1);
        // We double check that the players aren't trying to send small amount of ETH to press the button
        require(msg.value >= buttonBasePrice);
        // We verify that the game is not finished.
        require(timerEnd > now);
        // We verify that the value paid is correct.
        uint256 _buttonPrice = getButtonPrice();
        require(msg.value >= safeMultiply(_buttonPrice, _countPresses));
        // Process the button press
        timerEnd = uint32(now + timerInterval);
        winningAddress = msg.sender;
        // Transfer the commissions to affiliate, investor, pot and dev
        uint256 TwoPercentCom = (msg.value / 100) * 2;
        uint256 TenPercentCom = msg.value / 10;
        uint256 FifteenPercentCom = (msg.value / 100) * 15;
        // Commission #1. Affiliate
        if(_affId > 0 && _affId < players.length) {
            // If there is an affiliate we transfer his commission otherwise we keep the commission in the pot
            players[_affId].playerAddress.transfer(TenPercentCom);
        }
        // Commission #2. Main investor
        uint[] memory mainInvestors = GetMainInvestor();
        uint mainInvestor = mainInvestors[0];
        players[mainInvestor].playerAddress.transfer(FifteenPercentCom);
        countInvestorDividends = countInvestorDividends + FifteenPercentCom;
        // Commission #3. 2 to 10 main investors
        // We loop through all of the top 10 investors and send them their commission
        for(uint i = 1; i < mainInvestors.length; i++) {
            if(mainInvestors[i] != 0) {
                uint _investorId = mainInvestors[i];
                players[_investorId].playerAddress.transfer(TwoPercentCom);
                countInvestorDividends = countInvestorDividends + TwoPercentCom;
            }
        }
        // Commission #4. Dev
        cfoAddress.transfer(FifteenPercentCom);
        // Update or create the player and issue the VTL Tokens
        if(playersToId[msg.sender] > 0) {
            // Player exists, update data
            players[playersToId[msg.sender]].countVTL = players[playersToId[msg.sender]].countVTL + _countPresses;
        } else {
            // Player doesn't exist create it
            uint playerId = players.push(Player(msg.sender, _countPresses)) - 1;
            playersToId[msg.sender] = playerId;
        }
        // Send event
        emit NewPress(msg.sender, _countPresses, msg.value, timerEnd);
        // Increment the total count of presses
        countPresses = countPresses + _countPresses;
        amountPlayed = amountPlayed + msg.value;
    }
}