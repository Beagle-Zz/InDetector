contract c16596{
    // place a bet on a coin(horse) lockBetting
    function placeBet(bytes32 horse) external duringBetting payable  {
        require(msg.value >= 0.01 ether);
        if (voterIndex[msg.sender].total_bet==0) {
            total_bettors+=1;
        }
        uint _newAmount = voterIndex[msg.sender].bets[horse] + msg.value;
        voterIndex[msg.sender].bets[horse] = _newAmount;
        voterIndex[msg.sender].total_bet += uint160(msg.value);
        uint160 _newTotal = coinIndex[horse].total + uint160(msg.value); 
        uint32 _newCount = coinIndex[horse].count + 1;
        coinIndex[horse].total = _newTotal;
        coinIndex[horse].count = _newCount;
        emit Deposit(msg.sender, msg.value, horse, now);
    }
}