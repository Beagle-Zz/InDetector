contract c7627{
    /**
        @notice Approves the transfer of a given loan in the name of the lender, the behavior of this function is similar to
        "approve" in the ERC20 standard, but only one approved address is allowed at a time.
        The same method can be called passing 0x0 as parameter "to" to erase a previously approved address.
        @dev Required for ERC-721 compliance
        @param to Address allowed to transfer the loan or 0x0 to delete
        @param index Index of the loan
        @return true if the approve was done successfully
    */
    function approve(address to, uint256 index) public returns (bool) {
        Loan storage loan = loans[index];
        require(msg.sender == loan.lender);
        loan.approvedTransfer = to;
        Approval(msg.sender, to, index);
        return true;
    }
}