contract c2014{
    /*
     * public function
     * player submit bet
     * only if game is active & bet is valid can query oraclize and set player vars     
    */
    function playerRollDice(uint rollUnder) public 
        payable
        gameIsActive
        betIsValid(msg.value, rollUnder)
    {       
        /*
        * assign partially encrypted query to oraclize
        * only the apiKey is encrypted 
        * integer query is in plain text
        */       
        randomQueryID += 1;
        string memory queryString1 = "[URL] ['json(https://api.random.org/json-rpc/1/invoke).result.random[\"serialNumber\",\"data\"]', '\\n{\"jsonrpc\":\"2.0\",\"method\":\"generateSignedIntegers\",\"params\":{\"apiKey\":${[decrypt] BLxq6YMTZXcuXgU2soyabiwtdt6JBoTB3tPJWJfDinnwvvTP4nzwVQZSRqHG5TzA6gZkg/ucYpPtwCODzAESt90gC20MRiFJ3G25or0ePwmOBFRsCamwwBfto05YxgqLAc1WTbR8cNnMPP94NcgjG31i3q4LFVw=},\"n\":1,\"min\":1,\"max\":100,\"replacement\":true,\"base\":10${[identity] \"}\"},\"id\":";
        string memory queryString2 = uint2str(randomQueryID);
        string memory queryString3 = "${[identity] \"}\"}']";
        string memory queryString1_2 = queryString1.toSlice().concat(queryString2.toSlice());
        string memory queryString1_2_3 = queryString1_2.toSlice().concat(queryString3.toSlice());
        bytes32 rngId = oraclize_query("nested", queryString1_2_3, gasForOraclize);   
        /* map bet id to this oraclize query */
        playerBetId[rngId] = rngId;
        /* map player lucky number to this oraclize query */
        playerNumber[rngId] = rollUnder;
        /* map value of wager to this oraclize query */
        playerBetValue[rngId] = msg.value;
        /* map player address to this oraclize query */
        playerAddress[rngId] = msg.sender;
        /* safely map player profit to this oraclize query */          
        uint edge = houseEdge;
        if (rollUnder * 10 > houseEdge) edge = rollUnder*10;
        playerProfit[rngId] = msg.value * 100 / (safeSub(rollUnder, 1)) * edge / houseEdgeDivisor - msg.value;
        if (playerProfit[rngId] < 0) throw;
        /* safely increase maxPendingPayouts liability - calc all pending payouts under assumption they win */
        maxPendingPayouts = safeAdd(maxPendingPayouts, playerProfit[rngId]);
        /* check contract can payout on win */
        if(maxPendingPayouts >= contractBalance) throw;
        /* provides accurate numbers for web3 and allows for manual refunds in case of no oraclize __callback */
        LogBet(playerBetId[rngId], playerAddress[rngId], safeAdd(playerBetValue[rngId], playerProfit[rngId]), playerProfit[rngId], playerBetValue[rngId], playerNumber[rngId], randomQueryID);          
    }
}