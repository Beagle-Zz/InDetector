contract c14999{
    // Returns the largest bet such that we could pay out 10 maximum wins.
    // The likelihood that 10 maximum bets (with highest payouts) are won
    //  within a short period of time are extremely low.
    function curMaxBet() public view returns (uint _amount) {
        // Return largest bet such that 10*bet*payout = bankrollable()
        uint _maxPayout = 10 * 100 / uint(settings.minNumber);
        return bankrollAvailable() / _maxPayout;
    }
}