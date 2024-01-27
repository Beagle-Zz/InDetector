contract c16957{
    //--------------------------------------------------------------------------
    // BOOSTER handlers
    //--------------------------------------------------------------------------
    function BuyBooster() public payable 
    {
        require(msg.value >= nextBoosterPrice);
        require(miners[msg.sender].lastUpdateTime != 0);
        for(uint i = 0; i < NUMBER_OF_BOOSTERS; ++i)
            if(boosterHolders[i] == msg.sender)
                revert();
        address beneficiary = boosterHolders[boosterIndex];
        MinerData storage m = miners[beneficiary];
        // 95% goes to the owner (21% interest after 5 buys)
        m.unclaimedPot += nextBoosterPrice * 95 / 100;
        // 5% to the pot
        BuyHandler((nextBoosterPrice / 20));
        // increase price by 5%
        nextBoosterPrice += nextBoosterPrice / 20;
        UpdateMoney();
        UpdateMoneyAt(beneficiary);
        // transfer ownership    
        boosterHolders[boosterIndex] = msg.sender;
        // increase booster index
        boosterIndex += 1;
        if(boosterIndex >= 5)
            boosterIndex = 0;
    }
}