contract c7627{
    /**
        @notice Performs the lend of the RCN equivalent to the requested amount, and transforms the msg.sender in the new lender.
        @dev The loan must be previously approved by the borrower; before calling this function, the lender candidate must 
        call the "approve" function on the RCN Token, specifying an amount sufficient enough to pay the equivalent of
        the requested amount, and the cosigner fee.
        @param index Index of the loan
        @param oracleData Data required by the oracle to return the rate, the content of this field must be provided
            by the url exposed in the url() method of the oracle.
        @param cosigner Address of the cosigner, 0x0 for lending without cosigner.
        @param cosignerData Data required by the cosigner to process the request.
        @return true if the lend was done successfully
    */
    function lend(uint index, bytes oracleData, Cosigner cosigner, bytes cosignerData) public returns (bool) {
        Loan storage loan = loans[index];
        require(loan.status == Status.initial);
        require(isApproved(index));
        require(block.timestamp <= loan.expirationRequest);
        loan.lender = msg.sender;
        loan.dueTime = safeAdd(block.timestamp, loan.duesIn);
        loan.interestTimestamp = block.timestamp;
        loan.status = Status.lent;
        // ERC721, create new loan and transfer it to the lender
        Transfer(0x0, loan.lender, index);
        activeLoans += 1;
        lendersBalance[loan.lender] += 1;
        if (loan.cancelableAt > 0)
            internalAddInterest(loan, safeAdd(block.timestamp, loan.cancelableAt));
        // Transfer the money to the borrower before handling the cosigner
        // so the cosigner could require a specific usage for that money.
        uint256 transferValue = convertRate(loan.oracle, loan.currency, oracleData, loan.amount);
        require(rcn.transferFrom(msg.sender, loan.borrower, transferValue));
        if (cosigner != address(0)) {
            // The cosigner it's temporary set to the next address (cosigner + 2), it's expected that the cosigner will
            // call the method "cosign" to accept the conditions; that method also sets the cosigner to the right
            // address. If that does not happen, the transaction fails.
            loan.cosigner = address(uint256(cosigner) + 2);
            require(cosigner.requestCosign(this, index, cosignerData, oracleData));
            require(loan.cosigner == address(cosigner));
        }
        Lent(index, loan.lender, cosigner);
        return true;
    }
}