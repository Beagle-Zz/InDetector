contract c11162{
    /**
     * @dev Roll the dice for numbers
     */
    function rollOne(address referral, uint8 number)
    external payable isValidBet(rewardOne) bankNotEmpty {
        require(isValidNumber(number));       
        bets[msg.sender]++;
        splitTheBet(referral);
        uint8[5] memory numbers = [number,  0, 0, 0, 0];
        uint8[5] memory randoms = [getRN(), 0, 0, 0, 0];
        emit UserBet(msg.sender, number, 0, 0, 0, 0);
        emit DiceRoll(randoms[0], 0, 0, 0, 0);
        if (isWinner(1, numbers, randoms)) {
            rewardTheWinner(rewardOne);
        } else {
            emit Loser(msg.sender);
        }
    }
}