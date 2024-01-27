contract c16850{
    /*
     * @dev oraclize callback, only oraclize can call, payout should in active status
     * @param queryId
     * @param query result
     * @param query proof
     */
    function __callback(bytes32 myid, string result, bytes proof) public   
        onlyOraclize
    {  
        /* user address mapped to query id does not exist */
        require(userAddress[myid]!=0x0);
        /* random num solution from random.org(by default) */
        if (randomGenerateMethod == 0){
                /* keep oraclize honest by retrieving the serialNumber from random.org result */
                var sl_result = result.toSlice();
                sl_result.beyond("[".toSlice()).until("]".toSlice());
                uint serialNumberOfResult = parseInt(sl_result.split(', '.toSlice()).toString());          
                /* map random result to user */
                userDieResult[myid] = parseInt(sl_result.beyond("[".toSlice()).until("]".toSlice()).toString());                 
        } 
        /* random num solution from oraclize */        
        if (randomGenerateMethod == 1){
                uint maxRange = 100; /* this is the highest uint we want to get. It should never be greater than 2^(8*N), where N is the number of random bytes we had asked the datasource to return */
                userDieResult[myid] = uint(sha3(result)) % maxRange + 1; /* this is an efficient way to get the uint out in the [0, maxRange] range */
        }
        /* get the userAddress for this query id */
        userTempAddress[myid] = userAddress[myid];
        /* delete userAddress for this query id */
        delete userAddress[myid];
        /* map the userProfit for this query id */
        userTempReward[myid] = userProfit[myid];
        /* set  userProfit for this query id to 0 */
        userProfit[myid] = 0; 
        /* safely reduce maxPendingPayouts liability */
        maxPendingPayouts = safeSub(maxPendingPayouts, userTempReward[myid]);         
        /* map the userBetValue for this query id */
        userTempBetValue[myid] = userBetValue[myid];
        /* set  userBetValue for this query id to 0 */
        userBetValue[myid] = 0; 
        /* total number of bets */
        totalBets += 1;
        /* total wagered */
        totalWeiWagered += userTempBetValue[myid];                                                           
        /*
        * refund
        * if result is 0 result is empty or no proof refund original bet value
        * if refund fails save refund value to userPendingWithdrawals
        */
        if(userDieResult[myid] == 0 || bytes(result).length == 0 || bytes(proof).length == 0){                                                     
             /* Status: 0=lose, 1=win, 2=win + failed send, 3=refund, 4=refund + failed send*/ 
             /* 3 = refund */
             betStatus[myid] = 3;
            /*
            * send refund - external call to an untrusted contract
            * if send fails map refund value to userPendingWithdrawals[address]
            * for withdrawal later via userWithdrawPendingTransactions
            */
            if(!userTempAddress[myid].send(userTempBetValue[myid])){
                /* 4 = refund + failed send */
                betStatus[myid] = 4;              
                /* if send failed let user withdraw via userWithdrawPendingTransactions */
                userPendingWithdrawals[userTempAddress[myid]] = safeAdd(userPendingWithdrawals[userTempAddress[myid]], userTempBetValue[myid]);                        
            }
            emit LogResult(userBetId[myid], userTempAddress[myid], userNumber[myid], userDieResult[myid], userTempBetValue[myid], betStatus[myid], randomGenerateMethod, proof, serialNumberOfResult);
            return;
        }
        /*
        * pay winner
        * update contract balance to calculate new max bet
        * send reward
        * if send of reward fails save value to userPendingWithdrawals        
        */
        if(userDieResult[myid] < userNumber[myid]){ 
            /* safely reduce contract balance by user profit */
            contractBalance = safeSub(contractBalance, userTempReward[myid]); 
            /* update total wei won */
            totalWeiWon = safeAdd(totalWeiWon, userTempReward[myid]);              
            /* safely calculate payout via profit plus original wager */
            userTempReward[myid] = safeAdd(userTempReward[myid], userTempBetValue[myid]); 
            /* 1 = win */
            betStatus[myid] = 1;                           
            /* update maximum profit */
            setMaxProfit();
            /*
            * send win - external call to an untrusted contract
            * if send fails map reward value to userPendingWithdrawals[address]
            * for withdrawal later via userWithdrawPendingTransactions
            */
            if(!userTempAddress[myid].send(userTempReward[myid])){
                /* 2 = win + failed send */
                betStatus[myid] = 2;                   
                /* if send failed let user withdraw via userWithdrawPendingTransactions */
                userPendingWithdrawals[userTempAddress[myid]] = safeAdd(userPendingWithdrawals[userTempAddress[myid]], userTempReward[myid]);                               
            }
            emit LogResult(userBetId[myid], userTempAddress[myid], userNumber[myid], userDieResult[myid], userTempBetValue[myid], betStatus[myid], randomGenerateMethod, proof, serialNumberOfResult);
            return;
        }
        /*
        * no win
        * send 1 wei to a losing bet
        * update contract balance to calculate new max bet
        */
        if(userDieResult[myid] >= userNumber[myid]){
            /* 0 = lose */
            betStatus[myid] = 0;
            emit LogResult(userBetId[myid], userTempAddress[myid], userNumber[myid], userDieResult[myid], userTempBetValue[myid], betStatus[myid], randomGenerateMethod, proof, serialNumberOfResult);                                
            /*  
            *  safe adjust contractBalance
            *  setMaxProfit
            *  send 1 wei to losing bet
            */
            contractBalance = safeAdd(contractBalance, (userTempBetValue[myid]-1));                                                                         
            /* update maximum profit */
            setMaxProfit(); 
            /*
            * send 1 wei - external call to an untrusted contract                  
            */
            if(!userTempAddress[myid].send(1)){
                /* if send failed let user withdraw via userWithdrawPendingTransactions */                
               userPendingWithdrawals[userTempAddress[myid]] = safeAdd(userPendingWithdrawals[userTempAddress[myid]], 1);                                
            }                                   
            return;
        }
    }
}