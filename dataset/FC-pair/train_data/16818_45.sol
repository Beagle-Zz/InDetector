contract c16818{
    //
    // Internal Functions
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //
    /**
     * Take the Torch!  And receive KMS Tokens!
     */
    function takeTheTorch_(uint256 _amountPaid, address _takenBy, address _referredBy) internal antiWhalePrice(_amountPaid) returns (uint256) {
        require(_takenBy != address(0));
        require(_amountPaid >= 5 finney);
        require(_takenBy != torchRunners[0]); // Torch must be passed on
        if (_referredBy == address(this)) { _referredBy = address(0); }
        // Pass the Torch
        address previousLast = torchRunners[2];
        torchRunners[2] = torchRunners[1];
        torchRunners[1] = torchRunners[0];
        torchRunners[0] = _takenBy;
        // Get the Current Day Owner at OwnTheDay
        address dayOwner = OwnTheDayContract_.ownerOf(getDayIndex_(now));
        // Calculate Portions
        uint256 forDev = _amountPaid.mul(5).div(100);
        uint256 forTokens = _amountPaid.sub(_amountPaid.div(4));
        uint256 forPayout = _amountPaid.sub(forDev).sub(forTokens);
        uint256 forDayOwner = calculateDayOwnerCut_(forPayout);
        if (dayOwner == _takenBy) {
            forTokens = forTokens.add(forDayOwner);
            forPayout = _amountPaid.sub(forDev).sub(forTokens);
            playerData_[_takenBy].champion = true;
        } else {
            forPayout = forPayout.sub(forDayOwner);
        }
        // Fire Events
        onTorchPassed(torchRunners[1], _takenBy, _amountPaid);
        // Grant Mileage Tokens to Torch Holder
        uint256 mintedTokens = CryptoTorchToken_.mint.value(forTokens)(_takenBy, forTokens, _referredBy);
        // Update LeaderBoards
        updateLeaders_(_takenBy, _amountPaid);
        // Handle Payouts
        handlePayouts_(forDev, forPayout, forDayOwner, _takenBy, previousLast, dayOwner);
        return mintedTokens;
    }
}