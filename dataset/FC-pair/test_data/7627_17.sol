contract c7627{
    /**
        @notice Register an approvation made by a borrower in the past
        @dev The loan should exist and have an index
        @param identifier Identifier of the loan
        @return true if the approve was done successfully
    */
    function registerApprove(bytes32 identifier, uint8 v, bytes32 r, bytes32 s) public returns (bool) {
        uint256 index = identifierToIndex[identifier];
        require(index != 0);
        Loan storage loan = loans[index];
        require(loan.borrower == ecrecover(keccak256("\x19Ethereum Signed Message:\n32", identifier), v, r, s));
        loan.approbations[loan.borrower] = true;
        ApprovedBy(index, loan.borrower);
        return true;
    }
}