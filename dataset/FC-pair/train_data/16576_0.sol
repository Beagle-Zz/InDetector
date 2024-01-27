contract c16576{
    /*
     * bet size >= minBet, minNumber < minRollLimit < maxRollLimit - 1 < maxNumber
    */
    modifier betIsValid(uint _betSize, uint minRollLimit, uint maxRollLimit) {
        if (_betSize < minBet || maxRollLimit < minNumber || minRollLimit > maxNumber || maxRollLimit - 1 <= minRollLimit) throw;
        _;
    }
}