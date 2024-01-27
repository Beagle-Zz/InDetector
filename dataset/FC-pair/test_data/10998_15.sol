contract c10998{
    // Concludes the tournament and issues the prizes, then self-destructs.
    function concludeTournament(address _first   // 40% Ether.
                              , address _second  // 30% Ether.
                              , address _third   // 20% Ether.
                              , address _fourth) // 10% Ether.
        isAdministrator
        public 
    {
        // Don't hand out prizes until the final's... actually been played.
        require(gameFinished[64]
             && playerIsRegistered(_first)
             && playerIsRegistered(_second)
             && playerIsRegistered(_third)
             && playerIsRegistered(_fourth));
        // Send the money raised for Giveth.
        givethAddress.send(givethPool);
        // Determine 10% of the prize pool to distribute to winners.
        uint tenth    = prizePool.div(10);
        _first.send (tenth.mul(4));
        _second.send(tenth.mul(3));
        _third.send (tenth.mul(2));
        // Since there might be rounding errors, fourth place gets everything else.
        _fourth.send(address(this).balance);
        // Thanks for playing, everyone.
        selfdestruct(administrator);
    }
}