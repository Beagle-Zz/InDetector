contract c10084{
    // Concludes the tournament and issues the prizes, then self-destructs.
    function concludeTournament(address _first   // 40% 0xBTC.
                              , address _second  // 30% 0xBTC.
                              , address _third   // 20% 0xBTC.
                              , address _fourth) // 10% 0xBTC.
        isAdministrator
        public
    {
        // Don't hand out prizes until the final's... actually been played.
        require(gameFinished[64]
             && playerIsRegistered(_first)
             && playerIsRegistered(_second)
             && playerIsRegistered(_third)
             && playerIsRegistered(_fourth));
        // Determine 10% of the prize pool to distribute to winners.
        uint tenth       = prizePool.div(10);
        // Determine the prize allocations.
        uint firstPrize  = tenth.mul(4);
        uint secondPrize = tenth.mul(3);
        uint thirdPrize  = tenth.mul(2);
        // Send the first three prizes.
        BTCTKN.approve(_first, firstPrize);
        BTCTKN.transferFrom(address(this), _first, firstPrize);
        BTCTKN.approve(_second, secondPrize);
        BTCTKN.transferFrom(address(this), _second, secondPrize);
        BTCTKN.approve(_third, thirdPrize);
        BTCTKN.transferFrom(address(this), _third, thirdPrize);
        // Send the tokens raised to Giveth.
        BTCTKN.approve(givethAddress, givethPool);
        BTCTKN.transferFrom(address(this), givethAddress, givethPool);
        // Send the tokens assigned to developer.
        BTCTKN.approve(administrator, adminPool);
        BTCTKN.transferFrom(address(this), administrator, adminPool);
        // Since there might be rounding errors, fourth place gets everything else.
        uint fourthPrize = ((prizePool.sub(firstPrize)).sub(secondPrize)).sub(thirdPrize);
        BTCTKN.approve(_fourth, fourthPrize);
        BTCTKN.transferFrom(address(this), _fourth, fourthPrize);
        selfdestruct(administrator);
    }
}