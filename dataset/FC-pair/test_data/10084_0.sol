contract c10084{
    /* PUBLIC-FACING COMPETITION INTERACTIONS */
    // Register to participate in the competition. Apart from gas costs from
    //   making predictions and updating your score if necessary, this is the
    //   only 0xBTC you will need to spend throughout the tournament.
    function register()
        public
    {
        address _customerAddress = msg.sender;
        require(!playerRegistered[_customerAddress]);
        // Receive the entry fee tokens.
        BTCTKN.transferFrom(_customerAddress, address(this), entryFee);
        registeredPlayers = SafeMath.addint256(registeredPlayers, 1);
        playerRegistered[_customerAddress] = true;
        playerGamesScored[_customerAddress] = 0;
        playerList.push(_customerAddress);
        require(playerRegistered[_customerAddress]);
        prizePool  = prizePool.add(ninetyPercent);
        givethPool = givethPool.add(fivePercent);
        adminPool  = adminPool.add(fivePercent);
        emit Registration(_customerAddress);
    }
}