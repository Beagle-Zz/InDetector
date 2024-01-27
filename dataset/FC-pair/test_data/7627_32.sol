contract c7627{
    /**
        @notice Pay loan
        Does a payment of a given Loan, before performing the payment the accumulated
        interest is computed and added to the total pending amount.
        Before calling this function, the msg.sender must call the "approve" function on the RCN Token, specifying an amount
        sufficient enough to pay the equivalent of the desired payment and the oracle fee.
        If the paid pending amount equals zero, the loan changes status to "paid" and it is considered closed.
        @dev Because it is difficult or even impossible to know in advance how much RCN are going to be spent on the
        transaction*, we recommend performing the "approve" using an amount 5% superior to the wallet estimated
        spending. If the RCN spent results to be less, the extra tokens are never debited from the msg.sender.
        * The RCN rate can fluctuate on the same block, and it is impossible to know in advance the exact time of the
        confirmation of the transaction. 
        @param index Index of the loan
        @param _amount Amount to pay, specified in the loan currency; or in RCN if the loan has no oracle
        @param _from The identity of the payer
        @param oracleData Data required by the oracle to return the rate, the content of this field must be provided
            by the url exposed in the url() method of the oracle.
        @return true if the payment was executed successfully
    */
    function pay(uint index, uint256 _amount, address _from, bytes oracleData) public returns (bool) {
        Loan storage loan = loans[index];
        require(loan.status == Status.lent);
        addInterest(index);
        uint256 toPay = min(getPendingAmount(index), _amount);
        PartialPayment(index, msg.sender, _from, toPay);
        loan.paid = safeAdd(loan.paid, toPay);
        if (getRawPendingAmount(index) == 0) {
            TotalPayment(index);
            loan.status = Status.paid;
            // ERC721, remove loan from circulation
            lendersBalance[loan.lender] -= 1;
            activeLoans -= 1;
            Transfer(loan.lender, 0x0, index);
        }
        uint256 transferValue = convertRate(loan.oracle, loan.currency, oracleData, toPay);
        require(transferValue > 0 || toPay < _amount);
        lockTokens(rcn, transferValue);
        require(rcn.transferFrom(msg.sender, this, transferValue));
        loan.lenderBalance = safeAdd(transferValue, loan.lenderBalance);
        return true;
    }
}