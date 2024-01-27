contract c10774{
    /* returns CHUNK_SIZE loans of a given account, starting from some offset. Loans data encoded as:
        [loanId, collateralAmount, repaymentAmount, borrower, productId, state, maturity, disbursementTime,
                                                                                    loanAmount, interestAmount ] */
    function getLoansForAddress(address borrower, uint offset) external view returns (uint[10][CHUNK_SIZE] response) {
        uint[] storage loansForAddress = accountLoans[borrower];
        for (uint16 i = 0; i < CHUNK_SIZE; i++) {
            if (offset + i >= loansForAddress.length) { break; }
            response[i] = getLoanTuple(loansForAddress[offset + i]);
        }
    }
}