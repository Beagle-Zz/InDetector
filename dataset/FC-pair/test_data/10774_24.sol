contract c10774{
    /* returns CHUNK_SIZE loans starting from some offset. Loans data encoded as:
        [loanId, collateralAmount, repaymentAmount, borrower, productId, state, maturity, disbursementTime,
                                                                                    loanAmount, interestAmount ]   */
    function getLoans(uint offset) external view returns (uint[10][CHUNK_SIZE] response) {
        for (uint16 i = 0; i < CHUNK_SIZE; i++) {
            if (offset + i >= loans.length) { break; }
            response[i] = getLoanTuple(offset + i);
        }
    }
}