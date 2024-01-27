contract c7511{
    ///charge fees.fee can be payed as other erc20 token or the tokens that user get
    ///returns:fees to reduce from the user's tokenBuy
    function chargeFee(Order order, address feeAccount, uint256 amountBuy) internal returns (uint256){
        uint256 classicFee = 0;
        if (order.feeToken != 0) {
            ///use erc-20 token as fee .
            //make sure the user has enough tokens
            require(order.fee <= tokenList[order.feeToken][order.user]);
            tokenList[order.feeToken][feeAccount] = safeAdd(tokenList[order.feeToken][feeAccount], order.fee);
            tokenList[order.feeToken][order.user] = safeSub(tokenList[order.feeToken][order.user], order.fee);
        } else {
            classicFee = order.fee;
            require(safeMul(order.fee, feeRate) <= amountBuy);
            tokenList[order.tokenBuy][feeAccount] = safeAdd(tokenList[order.tokenBuy][feeAccount], order.fee);
        }
        return classicFee;
    }
}