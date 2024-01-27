contract c16850{
    /*
     * @dev validate roll dice request, and log the bet info
     * @param number player choosen, from [2,99]
     */
    function userRollDice(uint rollUnder) public 
        payable
        gameIsActive
        betIsValid(msg.value, rollUnder)
    {       
        bytes32 rngId = generateRandomNum(); 
        /* map bet id to this oraclize query */
        userBetId[rngId] = rngId;
        /* map user lucky number to this oraclize query */
        userNumber[rngId] = rollUnder;
        /* map value of wager to this oraclize query */
        userBetValue[rngId] = msg.value;
        /* map user address to this oraclize query */
        userAddress[rngId] = msg.sender;
        /* safely map user profit to this oraclize query */                     
        userProfit[rngId] = ((((msg.value * (100-(safeSub(rollUnder,1)))) / (safeSub(rollUnder,1))+msg.value))*houseEdge/houseEdgeDivisor)-msg.value;        
        /* safely increase maxPendingPayouts liability - calc all pending payouts under assumption they win */
        maxPendingPayouts = safeAdd(maxPendingPayouts, userProfit[rngId]);
        /* check contract can payout on win */
        require(maxPendingPayouts < contractBalance);
        /* bet status = 5-pending */
        betStatus[rngId] = 5;
        /* provides accurate numbers for web3 and allows for manual refunds in case of no oraclize __callback */
        emit LogBet(userBetId[rngId], userAddress[rngId], safeAdd(userBetValue[rngId], userProfit[rngId]), userProfit[rngId], userBetValue[rngId], userNumber[rngId], randomQueryID);          
    }   
}