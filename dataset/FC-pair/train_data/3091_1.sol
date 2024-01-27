contract c3091{
    // Bid function.
    function bid() public payable returns (uint256, uint256, uint256) {
        // Humans only unlike F3D
        require(msg.sender == tx.origin);
        require(msg.value == 0.001 ether);
        checkRoundEnd();
        // Add monies to pot
        devFee = devFee + (msg.value / 100);
        uint256 toAdd = msg.value - devFee;
        hourPot = hourPot + (toAdd / 3);
        dayPot = dayPot + (toAdd / 3);
        weekPot = weekPot + (toAdd - ((toAdd/3) + (toAdd/3)));
        // Random number via blockhash    
        seed = uint256(keccak256(blockhash(block.number - 1), seed, now));
        uint256 seed1 = seed;
        if (seed > hourPotHighscore) {
            hourPotLeader = msg.sender;
            hourPotExpiration = now + 1 hours;
            hourPotHighscore = seed;
        }
        seed = uint256(keccak256(blockhash(block.number - 1), seed, now));
        uint256 seed2 = seed;
        if (seed > dayPotHighscore) {
            dayPotLeader = msg.sender;
            dayPotExpiration = now + 1 days;
            dayPotHighscore = seed;
        }
        seed = uint256(keccak256(blockhash(block.number - 1), seed, now));
        uint256 seed3 = seed;
        if (seed > weekPotHighscore) {
            weekPotLeader = msg.sender;
            weekPotExpiration = now + 1 weeks;
            weekPotHighscore = seed;
        }
        totalBids++;
        playerLastScores[msg.sender] = threeUints(seed1, seed2, seed3);
        return (seed1, seed2, seed3);
    }
}