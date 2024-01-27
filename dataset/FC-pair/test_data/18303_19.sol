contract c18303{
    // Revoke tokens from incompleted KYC investors' addresses
    function revokeTokens(address _noneKycAddr, uint256 _transactionFee) external onlyOwnerOrAdmin {
        require(_noneKycAddr != address(0));
        uint256 investedAmount = totalInvestedAmountOf[_noneKycAddr];
        uint256 totalRemainingRefund = totalLoadedRefund.sub(totalRefundedAmount);
        require(whiteList[_noneKycAddr] == false && privateList[_noneKycAddr] == false);
        require(investedAmount > 0);
        require(totalRemainingRefund >= investedAmount);
        require(saleState == END_SALE);
        uint256 refundAmount = investedAmount.sub(_transactionFee);
        uint tokenRevoked = balances[_noneKycAddr];
        totalInvestedAmountOf[_noneKycAddr] = 0;
        balances[_noneKycAddr] = 0;
        totalRemainingTokensForSales = totalRemainingTokensForSales.add(tokenRevoked);
        totalRefundedAmount = totalRefundedAmount.add(refundAmount);
        _noneKycAddr.transfer(refundAmount);
        emit RevokeTokens(_noneKycAddr, refundAmount, tokenRevoked, _transactionFee);
    }    
}