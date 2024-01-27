contract c10084{
    // The emergency escape hatch in case something has gone wrong.
    // Given the small amount of individual coins per participant, it would
    // be far more expensive in gas than what's sent back if required.
    // You're going to have to take it on trust that I (the dev, duh), will
    // sort out refunds. Let's pray to Suarez it doesn't need pulling.
    function pullRipCord()
        isAdministrator
        public
    {
        uint totalPool = (prizePool.add(givethPool)).add(adminPool);
        BTCTKN.transferFrom(address(this), administrator, totalPool);
        selfdestruct(administrator);
    }
}