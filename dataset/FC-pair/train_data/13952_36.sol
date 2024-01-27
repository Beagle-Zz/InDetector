contract c13952{
    // Returns the largest bet such that we could pay out two RoyalFlushes.
    // The likelihood that two RoyalFlushes (with max bet size) are 
    //  won within a 255 block period is extremely low.
    function curMaxBet() public view returns (uint) {
        // Return largest bet such that RF*2*bet = bankrollable
        uint _maxPayout = payTables[settings.curPayTableId][HAND_RF] * 2;
        return bankrollAvailable() / _maxPayout;
    }
}