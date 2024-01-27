contract c12519{
    // Distribute jackpot. For finding a winner we use random number that is produced by multiplying a previous seed  
    // received from previous jackpot distribution and casted to uint last available block hash. 
    // Remainder from the received random number and total number of participants will give an index of a winner in the Jackpot participants list
    function distributeJackpot(uint _nextSeed) public onlyOwner returns (bool success) {
        assert(balances[0] >= jackpotMinimumAmount);
        assert(_nextSeed > 0);
        uint additionalSeed = uint(blockhash(block.number - 1));
        uint rnd = 0;
        while(rnd < index) {
            rnd += additionalSeed * seed;
        }
        uint winner = rnd % index;
        balances[jackpotParticipants[winner]] += balances[0];
        emit Transfer(0, jackpotParticipants[winner], balances[0]);
        balances[0] = 0;
        seed = _nextSeed;
        if (clearJackpotParticipantsAfterDistribution) {
            clearJackpotParticipants();
        }
        return true;
    }
}