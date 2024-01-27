contract c10711{
    /*** Public functions start here ***/
    function sellAllAmount(
        OtcInterface otc,
        TokenInterface payToken, 
        uint payAmt, 
        TokenInterface buyToken, 
        uint minBuyAmt
    ) public returns (uint) {
        require(payToken.transferFrom(msg.sender, this, payAmt));
        if (payToken.allowance(this, otc) < payAmt) {
            payToken.approve(otc, uint(-1));
        }
        uint buyAmt = otc.sellAllAmount(payToken, payAmt, buyToken, minBuyAmt);
        (uint feeAmt, uint buyAmtRemainder) = fees.takeFee(buyAmt, buyToken);
        require(buyToken.transfer(owner, feeAmt)); /* fee is taken */
        require(buyToken.transfer(msg.sender, buyAmtRemainder));
        return buyAmtRemainder;
    }
}