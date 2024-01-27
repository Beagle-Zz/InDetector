contract c7627{
    /**
        @notice Transfers a loan to a different lender, the caller must be the current lender or previously being
        approved with the method "approveTransfer"; only loans with the Status.lent status can be transfered.
        @dev Required for ERC-721 compliance
        @param index Index of the loan
        @param to New lender
        @return true if the transfer was done successfully
    */
    function transfer(address to, uint256 index) public returns (bool) {
        Loan storage loan = loans[index];
        require(msg.sender == loan.lender || msg.sender == loan.approvedTransfer || operators[loan.lender][msg.sender]);
        require(to != address(0));
        // ERC721, transfer loan to another address
        lendersBalance[loan.lender] -= 1;
        lendersBalance[to] += 1;
        Transfer(loan.lender, to, index);
        loan.lender = to;
        loan.approvedTransfer = address(0);
        return true;
    }
}