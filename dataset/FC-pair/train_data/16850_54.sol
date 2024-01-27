contract c16850{
    /*
     * @dev manual refund
     * only onlyOwnerOrOperator address can do manual refund
     * used only if bet placed but not execute payout method after stock market close
     * filter LogBet by address and/or userBetId, do manual refund only when meet below conditions:
     * 1. record should in logBet;
     * 2. record should not in logResult;
     * 3. record should not in logRefund;
     * if LogResult exists user should use the withdraw pattern userWithdrawPendingTransactions
     * if LogRefund exists means manual refund has been done before!
     * @param betId
     * @param address sendTo
     * @param original user profit
     * @param original bet value
    */
    function ownerRefundUser(bytes32 originalUserBetId, address sendTo, uint originalUserProfit, uint originalUserBetValue) public 
        onlyOwnerOrOperator
    {        
        require(msg.sender == owner || (msg.sender == operator.addr && operator.refundPermission == true && safeToSubtract(operator.refundAmtApprove, originalUserBetValue)));
        /* safely reduce pendingPayouts by userProfit[rngId] */
        maxPendingPayouts = safeSub(maxPendingPayouts, originalUserProfit);
        /* send refund */
        sendTo.transfer(originalUserBetValue);
        /* decrease approve amt if it's triggered by operator(no need to use safesub here, since passed above require() statement) */
        if(msg.sender == operator.addr){
            operator.refundAmtApprove = operator.refundAmtApprove -  originalUserBetValue;
        }
        /* update betStatus = 6-manual refund */
        betStatus[originalUserBetId] = 6;
        /* log refunds */
        emit LogRefund(originalUserBetId, sendTo, originalUserBetValue);        
    }    
}